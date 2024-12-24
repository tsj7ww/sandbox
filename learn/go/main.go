package main

import (
 "encoding/json"
 "fmt"
 "io/ioutil"
 "net/http"

 "github.com/aws/aws-lambda-go/events"
 "github.com/aws/aws-lambda-go/lambda"
)

const apiUrl = "https://www.metaweather.com/api/location/"

//type Event struct {WoeID string `json:"woeid"`}

type rawWeatherData struct {
 ConsolidatedWeather []struct {
	 WeatherStateName string  `json:"weather_state_name"`
	 MinTemp          float64 `json:"min_temp"`
	 MaxTemp          float64 `json:"max_temp"`
	 Humidity         int     `json:"humidity"`
	 Predictability   int     `json:"predictability"`
 } `json:"consolidated_weather"`
 Title        string `json:"title"`
 LocationType string `json:"location_type"`
 Woeid        int    `json:"woeid"`
 LattLong     string `json:"latt_long"`
}

type WeatherData struct {
 WeatherStateName string  `json:"weather_state_name"`
 MinTemp          float64 `json:"min_temp"`
 MaxTemp          float64 `json:"max_temp"`
 Title            string  `json:"title"`
 LattLong         string  `json:"latt_long"`
}

func returnHighestPredictability(data *rawWeatherData) (*WeatherData, error) {
 highestPredictability := 0
 var predictabilityIndex int

 for i, p := range data.ConsolidatedWeather {
	 if p.Predictability > highestPredictability {
		 highestPredictability = p.Predictability
		 predictabilityIndex = i
	 }
 }

 cleanedData := &WeatherData{
	 WeatherStateName: data.ConsolidatedWeather[predictabilityIndex].WeatherStateName,
	 MinTemp:          data.ConsolidatedWeather[predictabilityIndex].MinTemp,
	 MaxTemp:          data.ConsolidatedWeather[predictabilityIndex].MaxTemp,
	 Title:            data.Title,
	 LattLong:         data.LattLong,
 }

 return cleanedData, nil
}

func HandleRequest(req events.APIGatewayProxyRequest) (events.APIGatewayProxyResponse, error) {
 var weather *WeatherData
 //var event Event

 resp := events.APIGatewayProxyResponse{Headers: make(map[string]string)}
 resp.Headers["Access-Control-Allow-Origin"] = "*"
 resp.Headers["Access-Control-Allow-Headers"] = "Content-Type"

 //fmt.Println("Request body: " + req.Body)

 //err := json.Unmarshal([]byte(req.Body), &event)
 WoeID := req.QueryStringParameters["woeid"]
 // if err != nil {
	//  resp.StatusCode = 500
	//  resp.Body = err.Error()
	//  return resp, nil
 // }

 response, err := http.Get(apiUrl + WoeID)

 body, err := ioutil.ReadAll(response.Body)
 defer response.Body.Close()

 var data rawWeatherData
 json.Unmarshal(body, &data)

 weather, err = returnHighestPredictability(&data)

 re, err := json.Marshal(*weather)

 if err != nil {
	 fmt.Print(err.Error())
 }

 // resp.headers: {
	// 	"Access-Control-Allow-Headers" : "Content-Type",
	// 	"Access-Control-Allow-Origin": "https://www.example.com",
	// 	"Access-Control-Allow-Methods": "OPTIONS,POST,GET"
	// }
 resp.StatusCode = 200
 resp.Body = string(re)
 return resp, nil
}

func main() {
 lambda.Start(HandleRequest)
}
