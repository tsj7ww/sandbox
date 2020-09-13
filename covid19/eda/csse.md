# CSSE EDA 

#### Column Name[IDX] - Sample (Dtype) 
- FIPS[0] - float64 (45001.0 / nan) 
- ADMIN2[1] - object (Abbeville / nan) 
- PROVINCE_STATE[2] - object (South Carolina / nan) 
- COUNTRY_REGION[3] - object (US / Zimbabwe) 
- LAST_UPDATE[4] - object (2020-04-12 23:18:00 / 2020-05-01 02:32:28) 
- LAT[5] - float64 (34.22333378 / -19.015438) 
- LONG[6] - float64 (-82.46170658 / 29.154857) 
- CONFIRMED[7] - int64 (9 / 40) 
- DEATHS[8] - int64 (0 / 4) 
- RECOVERED[9] - int64 (0 / 5) 
- ACTIVE[10] - int64 (9 / 31) 
- COMBINED_KEY[11] - object (Abbeville, South Carolina, US / Zimbabwe) 
- DATA_DT[12] - object (2020-04-12 / 2020-04-30) 


#### Head / Tail [20] Sample 

<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>FIPS</th>
      <th>ADMIN2</th>
      <th>PROVINCE_STATE</th>
      <th>COUNTRY_REGION</th>
      <th>LAST_UPDATE</th>
      <th>LAT</th>
      <th>LONG</th>
      <th>CONFIRMED</th>
      <th>DEATHS</th>
      <th>RECOVERED</th>
      <th>ACTIVE</th>
      <th>COMBINED_KEY</th>
      <th>DATA_DT</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>45001.0</td>
      <td>Abbeville</td>
      <td>South Carolina</td>
      <td>US</td>
      <td>2020-04-12 23:18:00</td>
      <td>34.223334</td>
      <td>-82.461707</td>
      <td>9</td>
      <td>0</td>
      <td>0</td>
      <td>9</td>
      <td>Abbeville, South Carolina, US</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>1</th>
      <td>22001.0</td>
      <td>Acadia</td>
      <td>Louisiana</td>
      <td>US</td>
      <td>2020-04-12 23:18:00</td>
      <td>30.295065</td>
      <td>-92.414197</td>
      <td>99</td>
      <td>5</td>
      <td>0</td>
      <td>94</td>
      <td>Acadia, Louisiana, US</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>2</th>
      <td>51001.0</td>
      <td>Accomack</td>
      <td>Virginia</td>
      <td>US</td>
      <td>2020-04-12 23:18:00</td>
      <td>37.767072</td>
      <td>-75.632346</td>
      <td>15</td>
      <td>0</td>
      <td>0</td>
      <td>15</td>
      <td>Accomack, Virginia, US</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>3</th>
      <td>16001.0</td>
      <td>Ada</td>
      <td>Idaho</td>
      <td>US</td>
      <td>2020-04-12 23:18:00</td>
      <td>43.452658</td>
      <td>-116.241552</td>
      <td>517</td>
      <td>6</td>
      <td>0</td>
      <td>511</td>
      <td>Ada, Idaho, US</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>4</th>
      <td>19001.0</td>
      <td>Adair</td>
      <td>Iowa</td>
      <td>US</td>
      <td>2020-04-12 23:18:00</td>
      <td>41.330756</td>
      <td>-94.471059</td>
      <td>1</td>
      <td>0</td>
      <td>0</td>
      <td>1</td>
      <td>Adair, Iowa, US</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>5</th>
      <td>21001.0</td>
      <td>Adair</td>
      <td>Kentucky</td>
      <td>US</td>
      <td>2020-04-12 23:18:00</td>
      <td>37.104598</td>
      <td>-85.281297</td>
      <td>11</td>
      <td>0</td>
      <td>0</td>
      <td>11</td>
      <td>Adair, Kentucky, US</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>6</th>
      <td>29001.0</td>
      <td>Adair</td>
      <td>Missouri</td>
      <td>US</td>
      <td>2020-04-12 23:18:00</td>
      <td>40.190586</td>
      <td>-92.600782</td>
      <td>11</td>
      <td>0</td>
      <td>0</td>
      <td>11</td>
      <td>Adair, Missouri, US</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>7</th>
      <td>40001.0</td>
      <td>Adair</td>
      <td>Oklahoma</td>
      <td>US</td>
      <td>2020-04-12 23:18:00</td>
      <td>35.884942</td>
      <td>-94.658593</td>
      <td>27</td>
      <td>2</td>
      <td>0</td>
      <td>25</td>
      <td>Adair, Oklahoma, US</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>8</th>
      <td>8001.0</td>
      <td>Adams</td>
      <td>Colorado</td>
      <td>US</td>
      <td>2020-04-12 23:18:00</td>
      <td>39.874321</td>
      <td>-104.336258</td>
      <td>647</td>
      <td>26</td>
      <td>0</td>
      <td>621</td>
      <td>Adams, Colorado, US</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>9</th>
      <td>16003.0</td>
      <td>Adams</td>
      <td>Idaho</td>
      <td>US</td>
      <td>2020-04-12 23:18:00</td>
      <td>44.893336</td>
      <td>-116.454525</td>
      <td>1</td>
      <td>0</td>
      <td>0</td>
      <td>1</td>
      <td>Adams, Idaho, US</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>10</th>
      <td>17001.0</td>
      <td>Adams</td>
      <td>Illinois</td>
      <td>US</td>
      <td>2020-04-12 23:18:00</td>
      <td>39.988156</td>
      <td>-91.187868</td>
      <td>25</td>
      <td>0</td>
      <td>0</td>
      <td>25</td>
      <td>Adams, Illinois, US</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>11</th>
      <td>18001.0</td>
      <td>Adams</td>
      <td>Indiana</td>
      <td>US</td>
      <td>2020-04-12 23:18:00</td>
      <td>40.745765</td>
      <td>-84.936714</td>
      <td>5</td>
      <td>1</td>
      <td>0</td>
      <td>4</td>
      <td>Adams, Indiana, US</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>12</th>
      <td>28001.0</td>
      <td>Adams</td>
      <td>Mississippi</td>
      <td>US</td>
      <td>2020-04-12 23:18:00</td>
      <td>31.476698</td>
      <td>-91.353260</td>
      <td>51</td>
      <td>1</td>
      <td>0</td>
      <td>50</td>
      <td>Adams, Mississippi, US</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>13</th>
      <td>31001.0</td>
      <td>Adams</td>
      <td>Nebraska</td>
      <td>US</td>
      <td>2020-04-12 23:18:00</td>
      <td>40.524494</td>
      <td>-98.501178</td>
      <td>54</td>
      <td>0</td>
      <td>0</td>
      <td>54</td>
      <td>Adams, Nebraska, US</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>14</th>
      <td>39001.0</td>
      <td>Adams</td>
      <td>Ohio</td>
      <td>US</td>
      <td>2020-04-12 23:18:00</td>
      <td>38.845411</td>
      <td>-83.471896</td>
      <td>3</td>
      <td>0</td>
      <td>0</td>
      <td>3</td>
      <td>Adams, Ohio, US</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>15</th>
      <td>42001.0</td>
      <td>Adams</td>
      <td>Pennsylvania</td>
      <td>US</td>
      <td>2020-04-12 23:18:00</td>
      <td>39.871404</td>
      <td>-77.216103</td>
      <td>48</td>
      <td>1</td>
      <td>0</td>
      <td>47</td>
      <td>Adams, Pennsylvania, US</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>16</th>
      <td>53001.0</td>
      <td>Adams</td>
      <td>Washington</td>
      <td>US</td>
      <td>2020-04-12 23:18:00</td>
      <td>46.982998</td>
      <td>-118.560173</td>
      <td>36</td>
      <td>0</td>
      <td>0</td>
      <td>36</td>
      <td>Adams, Washington, US</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>17</th>
      <td>55001.0</td>
      <td>Adams</td>
      <td>Wisconsin</td>
      <td>US</td>
      <td>2020-04-12 23:18:00</td>
      <td>43.969747</td>
      <td>-89.767828</td>
      <td>2</td>
      <td>0</td>
      <td>0</td>
      <td>2</td>
      <td>Adams, Wisconsin, US</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>18</th>
      <td>50001.0</td>
      <td>Addison</td>
      <td>Vermont</td>
      <td>US</td>
      <td>2020-04-12 23:18:00</td>
      <td>44.032173</td>
      <td>-73.141309</td>
      <td>55</td>
      <td>1</td>
      <td>0</td>
      <td>54</td>
      <td>Addison, Vermont, US</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>19</th>
      <td>45003.0</td>
      <td>Aiken</td>
      <td>South Carolina</td>
      <td>US</td>
      <td>2020-04-12 23:18:00</td>
      <td>33.543380</td>
      <td>-81.636454</td>
      <td>50</td>
      <td>1</td>
      <td>0</td>
      <td>49</td>
      <td>Aiken, South Carolina, US</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>3157</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>Tanzania</td>
      <td>2020-05-01 02:32:28</td>
      <td>-6.369028</td>
      <td>34.888822</td>
      <td>480</td>
      <td>16</td>
      <td>167</td>
      <td>297</td>
      <td>Tanzania</td>
      <td>2020-04-30</td>
    </tr>
    <tr>
      <th>3158</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>Thailand</td>
      <td>2020-05-01 02:32:28</td>
      <td>15.870032</td>
      <td>100.992541</td>
      <td>2954</td>
      <td>54</td>
      <td>2684</td>
      <td>216</td>
      <td>Thailand</td>
      <td>2020-04-30</td>
    </tr>
    <tr>
      <th>3159</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>Timor-Leste</td>
      <td>2020-05-01 02:32:28</td>
      <td>-8.874217</td>
      <td>125.727539</td>
      <td>24</td>
      <td>0</td>
      <td>16</td>
      <td>8</td>
      <td>Timor-Leste</td>
      <td>2020-04-30</td>
    </tr>
    <tr>
      <th>3160</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>Togo</td>
      <td>2020-05-01 02:32:28</td>
      <td>8.619500</td>
      <td>0.824800</td>
      <td>116</td>
      <td>9</td>
      <td>65</td>
      <td>42</td>
      <td>Togo</td>
      <td>2020-04-30</td>
    </tr>
    <tr>
      <th>3161</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>Trinidad and Tobago</td>
      <td>2020-05-01 02:32:28</td>
      <td>10.691800</td>
      <td>-61.222500</td>
      <td>116</td>
      <td>8</td>
      <td>72</td>
      <td>36</td>
      <td>Trinidad and Tobago</td>
      <td>2020-04-30</td>
    </tr>
    <tr>
      <th>3162</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>Tunisia</td>
      <td>2020-05-01 02:32:28</td>
      <td>33.886917</td>
      <td>9.537499</td>
      <td>994</td>
      <td>41</td>
      <td>305</td>
      <td>648</td>
      <td>Tunisia</td>
      <td>2020-04-30</td>
    </tr>
    <tr>
      <th>3163</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>Turkey</td>
      <td>2020-05-01 02:32:28</td>
      <td>38.963700</td>
      <td>35.243300</td>
      <td>120204</td>
      <td>3174</td>
      <td>48886</td>
      <td>68144</td>
      <td>Turkey</td>
      <td>2020-04-30</td>
    </tr>
    <tr>
      <th>3164</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>Uganda</td>
      <td>2020-05-01 02:32:28</td>
      <td>1.373333</td>
      <td>32.290275</td>
      <td>83</td>
      <td>0</td>
      <td>52</td>
      <td>31</td>
      <td>Uganda</td>
      <td>2020-04-30</td>
    </tr>
    <tr>
      <th>3165</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>Ukraine</td>
      <td>2020-05-01 02:32:28</td>
      <td>48.379400</td>
      <td>31.165600</td>
      <td>10406</td>
      <td>261</td>
      <td>1238</td>
      <td>8907</td>
      <td>Ukraine</td>
      <td>2020-04-30</td>
    </tr>
    <tr>
      <th>3166</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>United Arab Emirates</td>
      <td>2020-05-01 02:32:28</td>
      <td>23.424076</td>
      <td>53.847818</td>
      <td>12481</td>
      <td>105</td>
      <td>2429</td>
      <td>9947</td>
      <td>United Arab Emirates</td>
      <td>2020-04-30</td>
    </tr>
    <tr>
      <th>3167</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>United Kingdom</td>
      <td>2020-05-01 02:32:28</td>
      <td>55.378100</td>
      <td>-3.436000</td>
      <td>171253</td>
      <td>26771</td>
      <td>0</td>
      <td>144482</td>
      <td>United Kingdom</td>
      <td>2020-04-30</td>
    </tr>
    <tr>
      <th>3168</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>Uruguay</td>
      <td>2020-05-01 02:32:28</td>
      <td>-32.522800</td>
      <td>-55.765800</td>
      <td>643</td>
      <td>17</td>
      <td>417</td>
      <td>209</td>
      <td>Uruguay</td>
      <td>2020-04-30</td>
    </tr>
    <tr>
      <th>3169</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>Uzbekistan</td>
      <td>2020-05-01 02:32:28</td>
      <td>41.377491</td>
      <td>64.585262</td>
      <td>2039</td>
      <td>9</td>
      <td>1133</td>
      <td>897</td>
      <td>Uzbekistan</td>
      <td>2020-04-30</td>
    </tr>
    <tr>
      <th>3170</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>Venezuela</td>
      <td>2020-05-01 02:32:28</td>
      <td>6.423800</td>
      <td>-66.589700</td>
      <td>333</td>
      <td>16</td>
      <td>142</td>
      <td>175</td>
      <td>Venezuela</td>
      <td>2020-04-30</td>
    </tr>
    <tr>
      <th>3171</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>Vietnam</td>
      <td>2020-05-01 02:32:28</td>
      <td>14.058324</td>
      <td>108.277199</td>
      <td>270</td>
      <td>0</td>
      <td>219</td>
      <td>51</td>
      <td>Vietnam</td>
      <td>2020-04-30</td>
    </tr>
    <tr>
      <th>3172</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>West Bank and Gaza</td>
      <td>2020-05-01 02:32:28</td>
      <td>31.952200</td>
      <td>35.233200</td>
      <td>344</td>
      <td>2</td>
      <td>76</td>
      <td>266</td>
      <td>West Bank and Gaza</td>
      <td>2020-04-30</td>
    </tr>
    <tr>
      <th>3173</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>Western Sahara</td>
      <td>2020-05-01 02:32:28</td>
      <td>24.215500</td>
      <td>-12.885800</td>
      <td>6</td>
      <td>0</td>
      <td>5</td>
      <td>1</td>
      <td>Western Sahara</td>
      <td>2020-04-30</td>
    </tr>
    <tr>
      <th>3174</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>Yemen</td>
      <td>2020-05-01 02:32:28</td>
      <td>15.552727</td>
      <td>48.516388</td>
      <td>6</td>
      <td>2</td>
      <td>1</td>
      <td>3</td>
      <td>Yemen</td>
      <td>2020-04-30</td>
    </tr>
    <tr>
      <th>3175</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>Zambia</td>
      <td>2020-05-01 02:32:28</td>
      <td>-13.133897</td>
      <td>27.849332</td>
      <td>106</td>
      <td>3</td>
      <td>55</td>
      <td>48</td>
      <td>Zambia</td>
      <td>2020-04-30</td>
    </tr>
    <tr>
      <th>3176</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>Zimbabwe</td>
      <td>2020-05-01 02:32:28</td>
      <td>-19.015438</td>
      <td>29.154857</td>
      <td>40</td>
      <td>4</td>
      <td>5</td>
      <td>31</td>
      <td>Zimbabwe</td>
      <td>2020-04-30</td>
    </tr>
  </tbody>
</table>