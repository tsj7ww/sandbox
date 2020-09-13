# CSSE EDA 

#### Column Name[IDX] - Sample (Dtype) 
- FIPS[0] - float64 (45001.0 / nan) 
- ADMIN2[1] - object (Abbeville / unassigned) 
- PROVINCE_STATE[2] - object (South Carolina / Utah) 
- COUNTRY_REGION[3] - object (US / US) 
- LAST_UPDATE[4] - object (2020-04-12 23:18:00 / 2020-04-12 23:18:00) 
- LAT[5] - float64 (34.22333378 / nan) 
- LONG[6] - float64 (-82.46170658 / nan) 
- CONFIRMED[7] - int64 (9 / 4) 
- DEATHS[8] - int64 (0 / 5) 
- RECOVERED[9] - int64 (0 / 0) 
- ACTIVE[10] - int64 (9 / -1) 
- COMBINED_KEY[11] - object (Abbeville, South Carolina, US / unassigned, Utah, US) 
- DATA_DT[12] - object (2020-04-12 / 2020-04-12) 


#### Head / Tail [100] Sample 

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
      <th>20</th>
      <td>12001.0</td>
      <td>Alachua</td>
      <td>Florida</td>
      <td>US</td>
      <td>2020-04-12 23:18:00</td>
      <td>29.678665</td>
      <td>-82.359282</td>
      <td>215</td>
      <td>0</td>
      <td>0</td>
      <td>215</td>
      <td>Alachua, Florida, US</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>21</th>
      <td>37001.0</td>
      <td>Alamance</td>
      <td>North Carolina</td>
      <td>US</td>
      <td>2020-04-12 23:18:00</td>
      <td>36.043470</td>
      <td>-79.399761</td>
      <td>36</td>
      <td>0</td>
      <td>0</td>
      <td>36</td>
      <td>Alamance, North Carolina, US</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>22</th>
      <td>6001.0</td>
      <td>Alameda</td>
      <td>California</td>
      <td>US</td>
      <td>2020-04-12 23:18:00</td>
      <td>37.646294</td>
      <td>-121.892927</td>
      <td>845</td>
      <td>23</td>
      <td>0</td>
      <td>822</td>
      <td>Alameda, California, US</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>23</th>
      <td>8003.0</td>
      <td>Alamosa</td>
      <td>Colorado</td>
      <td>US</td>
      <td>2020-04-12 23:18:00</td>
      <td>37.572506</td>
      <td>-105.788545</td>
      <td>7</td>
      <td>2</td>
      <td>0</td>
      <td>5</td>
      <td>Alamosa, Colorado, US</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>24</th>
      <td>36001.0</td>
      <td>Albany</td>
      <td>New York</td>
      <td>US</td>
      <td>2020-04-12 23:18:00</td>
      <td>42.600603</td>
      <td>-73.977239</td>
      <td>478</td>
      <td>12</td>
      <td>0</td>
      <td>466</td>
      <td>Albany, New York, US</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>25</th>
      <td>56001.0</td>
      <td>Albany</td>
      <td>Wyoming</td>
      <td>US</td>
      <td>2020-04-12 23:18:00</td>
      <td>41.654987</td>
      <td>-105.723542</td>
      <td>5</td>
      <td>0</td>
      <td>0</td>
      <td>5</td>
      <td>Albany, Wyoming, US</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>26</th>
      <td>51003.0</td>
      <td>Albemarle</td>
      <td>Virginia</td>
      <td>US</td>
      <td>2020-04-12 23:18:00</td>
      <td>38.020807</td>
      <td>-78.554811</td>
      <td>46</td>
      <td>0</td>
      <td>0</td>
      <td>46</td>
      <td>Albemarle, Virginia, US</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>27</th>
      <td>28003.0</td>
      <td>Alcorn</td>
      <td>Mississippi</td>
      <td>US</td>
      <td>2020-04-12 23:18:00</td>
      <td>34.880845</td>
      <td>-88.579962</td>
      <td>7</td>
      <td>0</td>
      <td>0</td>
      <td>7</td>
      <td>Alcorn, Mississippi, US</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>28</th>
      <td>37003.0</td>
      <td>Alexander</td>
      <td>North Carolina</td>
      <td>US</td>
      <td>2020-04-12 23:18:00</td>
      <td>35.922380</td>
      <td>-81.177519</td>
      <td>2</td>
      <td>0</td>
      <td>0</td>
      <td>2</td>
      <td>Alexander, North Carolina, US</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>29</th>
      <td>51510.0</td>
      <td>Alexandria</td>
      <td>Virginia</td>
      <td>US</td>
      <td>2020-04-12 23:18:00</td>
      <td>38.814003</td>
      <td>-77.081831</td>
      <td>198</td>
      <td>1</td>
      <td>0</td>
      <td>197</td>
      <td>Alexandria, Virginia, US</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>30</th>
      <td>19005.0</td>
      <td>Allamakee</td>
      <td>Iowa</td>
      <td>US</td>
      <td>2020-04-12 23:18:00</td>
      <td>43.283832</td>
      <td>-91.378609</td>
      <td>21</td>
      <td>1</td>
      <td>0</td>
      <td>20</td>
      <td>Allamakee, Iowa, US</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>31</th>
      <td>26005.0</td>
      <td>Allegan</td>
      <td>Michigan</td>
      <td>US</td>
      <td>2020-04-12 23:18:00</td>
      <td>42.591470</td>
      <td>-85.891029</td>
      <td>21</td>
      <td>0</td>
      <td>0</td>
      <td>21</td>
      <td>Allegan, Michigan, US</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>32</th>
      <td>24001.0</td>
      <td>Allegany</td>
      <td>Maryland</td>
      <td>US</td>
      <td>2020-04-12 23:18:00</td>
      <td>39.623576</td>
      <td>-78.692805</td>
      <td>13</td>
      <td>0</td>
      <td>0</td>
      <td>13</td>
      <td>Allegany, Maryland, US</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>33</th>
      <td>36003.0</td>
      <td>Allegany</td>
      <td>New York</td>
      <td>US</td>
      <td>2020-04-12 23:18:00</td>
      <td>42.257484</td>
      <td>-78.027505</td>
      <td>26</td>
      <td>1</td>
      <td>0</td>
      <td>25</td>
      <td>Allegany, New York, US</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>34</th>
      <td>37005.0</td>
      <td>Alleghany</td>
      <td>North Carolina</td>
      <td>US</td>
      <td>2020-04-12 23:18:00</td>
      <td>36.493609</td>
      <td>-81.128570</td>
      <td>2</td>
      <td>0</td>
      <td>0</td>
      <td>2</td>
      <td>Alleghany, North Carolina, US</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>35</th>
      <td>51005.0</td>
      <td>Alleghany</td>
      <td>Virginia</td>
      <td>US</td>
      <td>2020-04-12 23:18:00</td>
      <td>37.786361</td>
      <td>-80.002225</td>
      <td>4</td>
      <td>0</td>
      <td>0</td>
      <td>4</td>
      <td>Alleghany, Virginia, US</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>36</th>
      <td>42003.0</td>
      <td>Allegheny</td>
      <td>Pennsylvania</td>
      <td>US</td>
      <td>2020-04-12 23:18:00</td>
      <td>40.468099</td>
      <td>-79.981677</td>
      <td>857</td>
      <td>19</td>
      <td>0</td>
      <td>838</td>
      <td>Allegheny, Pennsylvania, US</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>37</th>
      <td>18003.0</td>
      <td>Allen</td>
      <td>Indiana</td>
      <td>US</td>
      <td>2020-04-12 23:18:00</td>
      <td>41.091943</td>
      <td>-85.068006</td>
      <td>147</td>
      <td>10</td>
      <td>0</td>
      <td>137</td>
      <td>Allen, Indiana, US</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>38</th>
      <td>21003.0</td>
      <td>Allen</td>
      <td>Kentucky</td>
      <td>US</td>
      <td>2020-04-12 23:18:00</td>
      <td>36.751976</td>
      <td>-86.194575</td>
      <td>4</td>
      <td>0</td>
      <td>0</td>
      <td>4</td>
      <td>Allen, Kentucky, US</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>39</th>
      <td>22003.0</td>
      <td>Allen</td>
      <td>Louisiana</td>
      <td>US</td>
      <td>2020-04-12 23:18:00</td>
      <td>30.653857</td>
      <td>-92.824420</td>
      <td>73</td>
      <td>7</td>
      <td>0</td>
      <td>66</td>
      <td>Allen, Louisiana, US</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>40</th>
      <td>39003.0</td>
      <td>Allen</td>
      <td>Ohio</td>
      <td>US</td>
      <td>2020-04-12 23:18:00</td>
      <td>40.772852</td>
      <td>-84.108023</td>
      <td>33</td>
      <td>2</td>
      <td>0</td>
      <td>31</td>
      <td>Allen, Ohio, US</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>41</th>
      <td>45005.0</td>
      <td>Allendale</td>
      <td>South Carolina</td>
      <td>US</td>
      <td>2020-04-12 23:18:00</td>
      <td>32.988374</td>
      <td>-81.353211</td>
      <td>5</td>
      <td>0</td>
      <td>0</td>
      <td>5</td>
      <td>Allendale, South Carolina, US</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>42</th>
      <td>26007.0</td>
      <td>Alpena</td>
      <td>Michigan</td>
      <td>US</td>
      <td>2020-04-12 23:18:00</td>
      <td>45.034777</td>
      <td>-83.622124</td>
      <td>1</td>
      <td>0</td>
      <td>0</td>
      <td>1</td>
      <td>Alpena, Michigan, US</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>43</th>
      <td>6003.0</td>
      <td>Alpine</td>
      <td>California</td>
      <td>US</td>
      <td>2020-04-12 23:18:00</td>
      <td>38.596786</td>
      <td>-119.822359</td>
      <td>2</td>
      <td>0</td>
      <td>0</td>
      <td>2</td>
      <td>Alpine, California, US</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>44</th>
      <td>6005.0</td>
      <td>Amador</td>
      <td>California</td>
      <td>US</td>
      <td>2020-04-12 23:18:00</td>
      <td>38.445831</td>
      <td>-120.656960</td>
      <td>7</td>
      <td>0</td>
      <td>0</td>
      <td>7</td>
      <td>Amador, California, US</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>45</th>
      <td>51007.0</td>
      <td>Amelia</td>
      <td>Virginia</td>
      <td>US</td>
      <td>2020-04-12 23:18:00</td>
      <td>37.340810</td>
      <td>-77.985846</td>
      <td>9</td>
      <td>0</td>
      <td>0</td>
      <td>9</td>
      <td>Amelia, Virginia, US</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>46</th>
      <td>51009.0</td>
      <td>Amherst</td>
      <td>Virginia</td>
      <td>US</td>
      <td>2020-04-12 23:18:00</td>
      <td>37.603083</td>
      <td>-79.145487</td>
      <td>10</td>
      <td>0</td>
      <td>0</td>
      <td>10</td>
      <td>Amherst, Virginia, US</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>47</th>
      <td>28005.0</td>
      <td>Amite</td>
      <td>Mississippi</td>
      <td>US</td>
      <td>2020-04-12 23:18:00</td>
      <td>31.174673</td>
      <td>-90.805016</td>
      <td>12</td>
      <td>1</td>
      <td>0</td>
      <td>11</td>
      <td>Amite, Mississippi, US</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>48</th>
      <td>2020.0</td>
      <td>Anchorage</td>
      <td>Alaska</td>
      <td>US</td>
      <td>2020-04-12 23:18:00</td>
      <td>61.149982</td>
      <td>-149.142699</td>
      <td>127</td>
      <td>4</td>
      <td>0</td>
      <td>123</td>
      <td>Anchorage, Alaska, US</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>49</th>
      <td>20003.0</td>
      <td>Anderson</td>
      <td>Kansas</td>
      <td>US</td>
      <td>2020-04-12 23:18:00</td>
      <td>38.214133</td>
      <td>-95.292728</td>
      <td>1</td>
      <td>0</td>
      <td>0</td>
      <td>1</td>
      <td>Anderson, Kansas, US</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>50</th>
      <td>21005.0</td>
      <td>Anderson</td>
      <td>Kentucky</td>
      <td>US</td>
      <td>2020-04-12 23:18:00</td>
      <td>38.006710</td>
      <td>-84.991717</td>
      <td>3</td>
      <td>1</td>
      <td>0</td>
      <td>2</td>
      <td>Anderson, Kentucky, US</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>51</th>
      <td>45007.0</td>
      <td>Anderson</td>
      <td>South Carolina</td>
      <td>US</td>
      <td>2020-04-12 23:18:00</td>
      <td>34.518281</td>
      <td>-82.639595</td>
      <td>106</td>
      <td>5</td>
      <td>0</td>
      <td>101</td>
      <td>Anderson, South Carolina, US</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>52</th>
      <td>47001.0</td>
      <td>Anderson</td>
      <td>Tennessee</td>
      <td>US</td>
      <td>2020-04-12 23:18:00</td>
      <td>36.126843</td>
      <td>-84.199658</td>
      <td>12</td>
      <td>1</td>
      <td>0</td>
      <td>11</td>
      <td>Anderson, Tennessee, US</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>53</th>
      <td>48001.0</td>
      <td>Anderson</td>
      <td>Texas</td>
      <td>US</td>
      <td>2020-04-12 23:18:00</td>
      <td>31.815347</td>
      <td>-95.653548</td>
      <td>3</td>
      <td>0</td>
      <td>0</td>
      <td>3</td>
      <td>Anderson, Texas, US</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>54</th>
      <td>29003.0</td>
      <td>Andrew</td>
      <td>Missouri</td>
      <td>US</td>
      <td>2020-04-12 23:18:00</td>
      <td>39.984922</td>
      <td>-94.801630</td>
      <td>1</td>
      <td>0</td>
      <td>0</td>
      <td>1</td>
      <td>Andrew, Missouri, US</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>55</th>
      <td>48003.0</td>
      <td>Andrews</td>
      <td>Texas</td>
      <td>US</td>
      <td>2020-04-12 23:18:00</td>
      <td>32.304686</td>
      <td>-102.637655</td>
      <td>12</td>
      <td>0</td>
      <td>0</td>
      <td>12</td>
      <td>Andrews, Texas, US</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>56</th>
      <td>23001.0</td>
      <td>Androscoggin</td>
      <td>Maine</td>
      <td>US</td>
      <td>2020-04-12 23:18:00</td>
      <td>44.166475</td>
      <td>-70.203806</td>
      <td>28</td>
      <td>0</td>
      <td>0</td>
      <td>28</td>
      <td>Androscoggin, Maine, US</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>57</th>
      <td>48005.0</td>
      <td>Angelina</td>
      <td>Texas</td>
      <td>US</td>
      <td>2020-04-12 23:18:00</td>
      <td>31.254573</td>
      <td>-94.609015</td>
      <td>16</td>
      <td>0</td>
      <td>0</td>
      <td>16</td>
      <td>Angelina, Texas, US</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>58</th>
      <td>24003.0</td>
      <td>Anne Arundel</td>
      <td>Maryland</td>
      <td>US</td>
      <td>2020-04-12 23:18:00</td>
      <td>39.006702</td>
      <td>-76.603293</td>
      <td>659</td>
      <td>27</td>
      <td>0</td>
      <td>632</td>
      <td>Anne Arundel, Maryland, US</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>59</th>
      <td>27003.0</td>
      <td>Anoka</td>
      <td>Minnesota</td>
      <td>US</td>
      <td>2020-04-12 23:18:00</td>
      <td>45.274760</td>
      <td>-93.246046</td>
      <td>68</td>
      <td>0</td>
      <td>0</td>
      <td>68</td>
      <td>Anoka, Minnesota, US</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>60</th>
      <td>37007.0</td>
      <td>Anson</td>
      <td>North Carolina</td>
      <td>US</td>
      <td>2020-04-12 23:18:00</td>
      <td>34.974032</td>
      <td>-80.099533</td>
      <td>10</td>
      <td>0</td>
      <td>0</td>
      <td>10</td>
      <td>Anson, North Carolina, US</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>61</th>
      <td>31003.0</td>
      <td>Antelope</td>
      <td>Nebraska</td>
      <td>US</td>
      <td>2020-04-12 23:18:00</td>
      <td>42.176955</td>
      <td>-98.066628</td>
      <td>1</td>
      <td>0</td>
      <td>0</td>
      <td>1</td>
      <td>Antelope, Nebraska, US</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>62</th>
      <td>26009.0</td>
      <td>Antrim</td>
      <td>Michigan</td>
      <td>US</td>
      <td>2020-04-12 23:18:00</td>
      <td>44.996902</td>
      <td>-85.155031</td>
      <td>8</td>
      <td>0</td>
      <td>0</td>
      <td>8</td>
      <td>Antrim, Michigan, US</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>63</th>
      <td>4001.0</td>
      <td>Apache</td>
      <td>Arizona</td>
      <td>US</td>
      <td>2020-04-12 23:18:00</td>
      <td>35.394650</td>
      <td>-109.489238</td>
      <td>72</td>
      <td>0</td>
      <td>0</td>
      <td>72</td>
      <td>Apache, Arizona, US</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>64</th>
      <td>19007.0</td>
      <td>Appanoose</td>
      <td>Iowa</td>
      <td>US</td>
      <td>2020-04-12 23:18:00</td>
      <td>40.743245</td>
      <td>-92.868659</td>
      <td>1</td>
      <td>1</td>
      <td>0</td>
      <td>0</td>
      <td>Appanoose, Iowa, US</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>65</th>
      <td>13001.0</td>
      <td>Appling</td>
      <td>Georgia</td>
      <td>US</td>
      <td>2020-04-12 23:18:00</td>
      <td>31.748472</td>
      <td>-82.289091</td>
      <td>9</td>
      <td>0</td>
      <td>0</td>
      <td>9</td>
      <td>Appling, Georgia, US</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>66</th>
      <td>51011.0</td>
      <td>Appomattox</td>
      <td>Virginia</td>
      <td>US</td>
      <td>2020-04-12 23:18:00</td>
      <td>37.375699</td>
      <td>-78.813400</td>
      <td>7</td>
      <td>0</td>
      <td>0</td>
      <td>7</td>
      <td>Appomattox, Virginia, US</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>67</th>
      <td>48007.0</td>
      <td>Aransas</td>
      <td>Texas</td>
      <td>US</td>
      <td>2020-04-12 23:18:00</td>
      <td>28.105562</td>
      <td>-96.999505</td>
      <td>2</td>
      <td>0</td>
      <td>0</td>
      <td>2</td>
      <td>Aransas, Texas, US</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>68</th>
      <td>8005.0</td>
      <td>Arapahoe</td>
      <td>Colorado</td>
      <td>US</td>
      <td>2020-04-12 23:18:00</td>
      <td>39.649775</td>
      <td>-104.335362</td>
      <td>1083</td>
      <td>38</td>
      <td>0</td>
      <td>1045</td>
      <td>Arapahoe, Colorado, US</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>69</th>
      <td>8007.0</td>
      <td>Archuleta</td>
      <td>Colorado</td>
      <td>US</td>
      <td>2020-04-12 23:18:00</td>
      <td>37.194742</td>
      <td>-107.047687</td>
      <td>6</td>
      <td>0</td>
      <td>0</td>
      <td>6</td>
      <td>Archuleta, Colorado, US</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>70</th>
      <td>26011.0</td>
      <td>Arenac</td>
      <td>Michigan</td>
      <td>US</td>
      <td>2020-04-12 23:18:00</td>
      <td>44.063626</td>
      <td>-83.892776</td>
      <td>5</td>
      <td>0</td>
      <td>0</td>
      <td>5</td>
      <td>Arenac, Michigan, US</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>71</th>
      <td>5001.0</td>
      <td>Arkansas</td>
      <td>Arkansas</td>
      <td>US</td>
      <td>2020-04-12 23:18:00</td>
      <td>34.291452</td>
      <td>-91.372773</td>
      <td>2</td>
      <td>0</td>
      <td>0</td>
      <td>2</td>
      <td>Arkansas, Arkansas, US</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>72</th>
      <td>51013.0</td>
      <td>Arlington</td>
      <td>Virginia</td>
      <td>US</td>
      <td>2020-04-12 23:18:00</td>
      <td>38.876767</td>
      <td>-77.101399</td>
      <td>366</td>
      <td>2</td>
      <td>0</td>
      <td>364</td>
      <td>Arlington, Virginia, US</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>73</th>
      <td>42005.0</td>
      <td>Armstrong</td>
      <td>Pennsylvania</td>
      <td>US</td>
      <td>2020-04-12 23:18:00</td>
      <td>40.816656</td>
      <td>-79.462908</td>
      <td>27</td>
      <td>1</td>
      <td>0</td>
      <td>26</td>
      <td>Armstrong, Pennsylvania, US</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>74</th>
      <td>23003.0</td>
      <td>Aroostook</td>
      <td>Maine</td>
      <td>US</td>
      <td>2020-04-12 23:18:00</td>
      <td>46.659263</td>
      <td>-68.598412</td>
      <td>2</td>
      <td>0</td>
      <td>0</td>
      <td>2</td>
      <td>Aroostook, Maine, US</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>75</th>
      <td>22005.0</td>
      <td>Ascension</td>
      <td>Louisiana</td>
      <td>US</td>
      <td>2020-04-12 23:18:00</td>
      <td>30.204062</td>
      <td>-90.913284</td>
      <td>428</td>
      <td>23</td>
      <td>0</td>
      <td>405</td>
      <td>Ascension, Louisiana, US</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>76</th>
      <td>37009.0</td>
      <td>Ashe</td>
      <td>North Carolina</td>
      <td>US</td>
      <td>2020-04-12 23:18:00</td>
      <td>36.432962</td>
      <td>-81.498627</td>
      <td>4</td>
      <td>0</td>
      <td>0</td>
      <td>4</td>
      <td>Ashe, North Carolina, US</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>77</th>
      <td>39005.0</td>
      <td>Ashland</td>
      <td>Ohio</td>
      <td>US</td>
      <td>2020-04-12 23:18:00</td>
      <td>40.847723</td>
      <td>-82.272808</td>
      <td>5</td>
      <td>0</td>
      <td>0</td>
      <td>5</td>
      <td>Ashland, Ohio, US</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>78</th>
      <td>55003.0</td>
      <td>Ashland</td>
      <td>Wisconsin</td>
      <td>US</td>
      <td>2020-04-12 23:18:00</td>
      <td>46.319569</td>
      <td>-90.678371</td>
      <td>2</td>
      <td>0</td>
      <td>0</td>
      <td>2</td>
      <td>Ashland, Wisconsin, US</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>79</th>
      <td>5003.0</td>
      <td>Ashley</td>
      <td>Arkansas</td>
      <td>US</td>
      <td>2020-04-12 23:18:00</td>
      <td>33.191535</td>
      <td>-91.769847</td>
      <td>10</td>
      <td>0</td>
      <td>0</td>
      <td>10</td>
      <td>Ashley, Arkansas, US</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>80</th>
      <td>39007.0</td>
      <td>Ashtabula</td>
      <td>Ohio</td>
      <td>US</td>
      <td>2020-04-12 23:18:00</td>
      <td>41.708603</td>
      <td>-80.748302</td>
      <td>26</td>
      <td>2</td>
      <td>0</td>
      <td>24</td>
      <td>Ashtabula, Ohio, US</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>81</th>
      <td>53003.0</td>
      <td>Asotin</td>
      <td>Washington</td>
      <td>US</td>
      <td>2020-04-12 23:18:00</td>
      <td>46.188944</td>
      <td>-117.202285</td>
      <td>5</td>
      <td>0</td>
      <td>0</td>
      <td>5</td>
      <td>Asotin, Washington, US</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>82</th>
      <td>22007.0</td>
      <td>Assumption</td>
      <td>Louisiana</td>
      <td>US</td>
      <td>2020-04-12 23:18:00</td>
      <td>29.899462</td>
      <td>-91.064616</td>
      <td>116</td>
      <td>1</td>
      <td>0</td>
      <td>115</td>
      <td>Assumption, Louisiana, US</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>83</th>
      <td>48013.0</td>
      <td>Atascosa</td>
      <td>Texas</td>
      <td>US</td>
      <td>2020-04-12 23:18:00</td>
      <td>28.893330</td>
      <td>-98.527305</td>
      <td>9</td>
      <td>0</td>
      <td>0</td>
      <td>9</td>
      <td>Atascosa, Texas, US</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>84</th>
      <td>20005.0</td>
      <td>Atchison</td>
      <td>Kansas</td>
      <td>US</td>
      <td>2020-04-12 23:18:00</td>
      <td>39.531857</td>
      <td>-95.308700</td>
      <td>3</td>
      <td>0</td>
      <td>0</td>
      <td>3</td>
      <td>Atchison, Kansas, US</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>85</th>
      <td>29005.0</td>
      <td>Atchison</td>
      <td>Missouri</td>
      <td>US</td>
      <td>2020-04-12 23:18:00</td>
      <td>40.432387</td>
      <td>-95.429706</td>
      <td>1</td>
      <td>0</td>
      <td>0</td>
      <td>1</td>
      <td>Atchison, Missouri, US</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>86</th>
      <td>39009.0</td>
      <td>Athens</td>
      <td>Ohio</td>
      <td>US</td>
      <td>2020-04-12 23:18:00</td>
      <td>39.334256</td>
      <td>-82.042786</td>
      <td>3</td>
      <td>1</td>
      <td>0</td>
      <td>2</td>
      <td>Athens, Ohio, US</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>87</th>
      <td>13003.0</td>
      <td>Atkinson</td>
      <td>Georgia</td>
      <td>US</td>
      <td>2020-04-12 23:18:00</td>
      <td>31.296335</td>
      <td>-82.875459</td>
      <td>2</td>
      <td>0</td>
      <td>0</td>
      <td>2</td>
      <td>Atkinson, Georgia, US</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>88</th>
      <td>34001.0</td>
      <td>Atlantic</td>
      <td>New Jersey</td>
      <td>US</td>
      <td>2020-04-12 23:18:00</td>
      <td>39.475387</td>
      <td>-74.658485</td>
      <td>253</td>
      <td>8</td>
      <td>0</td>
      <td>245</td>
      <td>Atlantic, New Jersey, US</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>89</th>
      <td>40005.0</td>
      <td>Atoka</td>
      <td>Oklahoma</td>
      <td>US</td>
      <td>2020-04-12 23:18:00</td>
      <td>34.373666</td>
      <td>-96.038025</td>
      <td>1</td>
      <td>0</td>
      <td>0</td>
      <td>1</td>
      <td>Atoka, Oklahoma, US</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>90</th>
      <td>28007.0</td>
      <td>Attala</td>
      <td>Mississippi</td>
      <td>US</td>
      <td>2020-04-12 23:18:00</td>
      <td>33.086588</td>
      <td>-89.578386</td>
      <td>20</td>
      <td>0</td>
      <td>0</td>
      <td>20</td>
      <td>Attala, Mississippi, US</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>91</th>
      <td>19009.0</td>
      <td>Audubon</td>
      <td>Iowa</td>
      <td>US</td>
      <td>2020-04-12 23:18:00</td>
      <td>41.684463</td>
      <td>-94.905819</td>
      <td>1</td>
      <td>0</td>
      <td>0</td>
      <td>1</td>
      <td>Audubon, Iowa, US</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>92</th>
      <td>39011.0</td>
      <td>Auglaize</td>
      <td>Ohio</td>
      <td>US</td>
      <td>2020-04-12 23:18:00</td>
      <td>40.559989</td>
      <td>-84.224214</td>
      <td>14</td>
      <td>1</td>
      <td>0</td>
      <td>13</td>
      <td>Auglaize, Ohio, US</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>93</th>
      <td>51015.0</td>
      <td>Augusta</td>
      <td>Virginia</td>
      <td>US</td>
      <td>2020-04-12 23:18:00</td>
      <td>38.164046</td>
      <td>-79.124616</td>
      <td>17</td>
      <td>0</td>
      <td>0</td>
      <td>17</td>
      <td>Augusta, Virginia, US</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>94</th>
      <td>46003.0</td>
      <td>Aurora</td>
      <td>South Dakota</td>
      <td>US</td>
      <td>2020-04-12 23:18:00</td>
      <td>43.717577</td>
      <td>-98.560505</td>
      <td>1</td>
      <td>0</td>
      <td>0</td>
      <td>1</td>
      <td>Aurora, South Dakota, US</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>95</th>
      <td>48015.0</td>
      <td>Austin</td>
      <td>Texas</td>
      <td>US</td>
      <td>2020-04-12 23:18:00</td>
      <td>29.885487</td>
      <td>-96.277369</td>
      <td>10</td>
      <td>0</td>
      <td>0</td>
      <td>10</td>
      <td>Austin, Texas, US</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>96</th>
      <td>1001.0</td>
      <td>Autauga</td>
      <td>Alabama</td>
      <td>US</td>
      <td>2020-04-12 23:18:00</td>
      <td>32.539527</td>
      <td>-86.644082</td>
      <td>19</td>
      <td>1</td>
      <td>0</td>
      <td>18</td>
      <td>Autauga, Alabama, US</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>97</th>
      <td>22009.0</td>
      <td>Avoyelles</td>
      <td>Louisiana</td>
      <td>US</td>
      <td>2020-04-12 23:18:00</td>
      <td>31.077962</td>
      <td>-92.000794</td>
      <td>61</td>
      <td>1</td>
      <td>0</td>
      <td>60</td>
      <td>Avoyelles, Louisiana, US</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>98</th>
      <td>8009.0</td>
      <td>Baca</td>
      <td>Colorado</td>
      <td>US</td>
      <td>2020-04-12 23:18:00</td>
      <td>37.319409</td>
      <td>-102.560322</td>
      <td>10</td>
      <td>0</td>
      <td>0</td>
      <td>10</td>
      <td>Baca, Colorado, US</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>99</th>
      <td>13005.0</td>
      <td>Bacon</td>
      <td>Georgia</td>
      <td>US</td>
      <td>2020-04-12 23:18:00</td>
      <td>31.554565</td>
      <td>-82.459365</td>
      <td>14</td>
      <td>0</td>
      <td>0</td>
      <td>14</td>
      <td>Bacon, Georgia, US</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>2888</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>Jamaica</td>
      <td>2020-04-12 23:17:00</td>
      <td>18.109600</td>
      <td>-77.297500</td>
      <td>69</td>
      <td>4</td>
      <td>13</td>
      <td>52</td>
      <td>Jamaica</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>2889</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>Japan</td>
      <td>2020-04-12 23:17:00</td>
      <td>36.204824</td>
      <td>138.252924</td>
      <td>6748</td>
      <td>108</td>
      <td>762</td>
      <td>5878</td>
      <td>Japan</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>2890</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>Jordan</td>
      <td>2020-04-12 23:17:00</td>
      <td>31.240000</td>
      <td>36.510000</td>
      <td>389</td>
      <td>7</td>
      <td>201</td>
      <td>181</td>
      <td>Jordan</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>2891</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>Kazakhstan</td>
      <td>2020-04-12 23:17:00</td>
      <td>48.019600</td>
      <td>66.923700</td>
      <td>951</td>
      <td>10</td>
      <td>99</td>
      <td>842</td>
      <td>Kazakhstan</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>2892</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>Kenya</td>
      <td>2020-04-12 23:17:00</td>
      <td>-0.023600</td>
      <td>37.906200</td>
      <td>197</td>
      <td>8</td>
      <td>25</td>
      <td>164</td>
      <td>Kenya</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>2893</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>Korea, South</td>
      <td>2020-04-12 23:17:00</td>
      <td>35.907757</td>
      <td>127.766922</td>
      <td>10512</td>
      <td>214</td>
      <td>7368</td>
      <td>2930</td>
      <td>Korea, South</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>2894</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>Kosovo</td>
      <td>2020-04-12 23:17:00</td>
      <td>42.602636</td>
      <td>20.902977</td>
      <td>283</td>
      <td>7</td>
      <td>58</td>
      <td>218</td>
      <td>Kosovo</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>2895</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>Kuwait</td>
      <td>2020-04-12 23:17:00</td>
      <td>29.311660</td>
      <td>47.481766</td>
      <td>1234</td>
      <td>1</td>
      <td>142</td>
      <td>1091</td>
      <td>Kuwait</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>2896</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>Kyrgyzstan</td>
      <td>2020-04-12 23:17:00</td>
      <td>41.204380</td>
      <td>74.766098</td>
      <td>377</td>
      <td>5</td>
      <td>54</td>
      <td>318</td>
      <td>Kyrgyzstan</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>2897</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>Laos</td>
      <td>2020-04-12 23:17:00</td>
      <td>19.856270</td>
      <td>102.495496</td>
      <td>19</td>
      <td>0</td>
      <td>0</td>
      <td>19</td>
      <td>Laos</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>2898</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>Latvia</td>
      <td>2020-04-12 23:17:00</td>
      <td>56.879600</td>
      <td>24.603200</td>
      <td>651</td>
      <td>5</td>
      <td>16</td>
      <td>630</td>
      <td>Latvia</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>2899</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>Lebanon</td>
      <td>2020-04-12 23:17:00</td>
      <td>33.854700</td>
      <td>35.862300</td>
      <td>630</td>
      <td>20</td>
      <td>80</td>
      <td>530</td>
      <td>Lebanon</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>2900</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>Liberia</td>
      <td>2020-04-12 23:17:00</td>
      <td>6.428055</td>
      <td>-9.429499</td>
      <td>50</td>
      <td>5</td>
      <td>3</td>
      <td>42</td>
      <td>Liberia</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>2901</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>Libya</td>
      <td>2020-04-12 23:17:00</td>
      <td>26.335100</td>
      <td>17.228331</td>
      <td>25</td>
      <td>1</td>
      <td>9</td>
      <td>15</td>
      <td>Libya</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>2902</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>Liechtenstein</td>
      <td>2020-04-12 23:17:00</td>
      <td>47.140000</td>
      <td>9.550000</td>
      <td>79</td>
      <td>1</td>
      <td>55</td>
      <td>23</td>
      <td>Liechtenstein</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>2903</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>Lithuania</td>
      <td>2020-04-12 23:17:00</td>
      <td>55.169400</td>
      <td>23.881300</td>
      <td>1053</td>
      <td>23</td>
      <td>97</td>
      <td>933</td>
      <td>Lithuania</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>2904</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>Luxembourg</td>
      <td>2020-04-12 23:17:00</td>
      <td>49.815300</td>
      <td>6.129600</td>
      <td>3281</td>
      <td>66</td>
      <td>500</td>
      <td>2715</td>
      <td>Luxembourg</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>2905</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>MS Zaandam</td>
      <td>2020-04-12 23:17:00</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>9</td>
      <td>2</td>
      <td>0</td>
      <td>7</td>
      <td>MS Zaandam</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>2906</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>Madagascar</td>
      <td>2020-04-12 23:17:00</td>
      <td>-18.766947</td>
      <td>46.869107</td>
      <td>106</td>
      <td>0</td>
      <td>20</td>
      <td>86</td>
      <td>Madagascar</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>2907</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>Malawi</td>
      <td>2020-04-12 23:17:00</td>
      <td>-13.254308</td>
      <td>34.301525</td>
      <td>13</td>
      <td>2</td>
      <td>0</td>
      <td>11</td>
      <td>Malawi</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>2908</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>Malaysia</td>
      <td>2020-04-12 23:17:00</td>
      <td>4.210484</td>
      <td>101.975766</td>
      <td>4683</td>
      <td>76</td>
      <td>2108</td>
      <td>2499</td>
      <td>Malaysia</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>2909</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>Maldives</td>
      <td>2020-04-12 23:17:00</td>
      <td>3.202800</td>
      <td>73.220700</td>
      <td>20</td>
      <td>0</td>
      <td>14</td>
      <td>6</td>
      <td>Maldives</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>2910</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>Mali</td>
      <td>2020-04-12 23:17:00</td>
      <td>17.570692</td>
      <td>-3.996166</td>
      <td>105</td>
      <td>9</td>
      <td>22</td>
      <td>74</td>
      <td>Mali</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>2911</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>Malta</td>
      <td>2020-04-12 23:17:00</td>
      <td>35.937500</td>
      <td>14.375400</td>
      <td>378</td>
      <td>3</td>
      <td>44</td>
      <td>331</td>
      <td>Malta</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>2912</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>Mauritania</td>
      <td>2020-04-12 23:17:00</td>
      <td>21.007900</td>
      <td>-10.940800</td>
      <td>7</td>
      <td>1</td>
      <td>2</td>
      <td>4</td>
      <td>Mauritania</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>2913</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>Mauritius</td>
      <td>2020-04-12 23:17:00</td>
      <td>-20.348404</td>
      <td>57.552152</td>
      <td>324</td>
      <td>9</td>
      <td>42</td>
      <td>273</td>
      <td>Mauritius</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>2914</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>Mexico</td>
      <td>2020-04-12 23:17:00</td>
      <td>23.634500</td>
      <td>-102.552800</td>
      <td>4219</td>
      <td>273</td>
      <td>1772</td>
      <td>2174</td>
      <td>Mexico</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>2915</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>Moldova</td>
      <td>2020-04-12 23:17:00</td>
      <td>47.411600</td>
      <td>28.369900</td>
      <td>1662</td>
      <td>31</td>
      <td>94</td>
      <td>1537</td>
      <td>Moldova</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>2916</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>Monaco</td>
      <td>2020-04-12 23:17:00</td>
      <td>43.733300</td>
      <td>7.416700</td>
      <td>93</td>
      <td>1</td>
      <td>6</td>
      <td>86</td>
      <td>Monaco</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>2917</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>Mongolia</td>
      <td>2020-04-12 23:17:00</td>
      <td>46.862500</td>
      <td>103.846700</td>
      <td>16</td>
      <td>0</td>
      <td>4</td>
      <td>12</td>
      <td>Mongolia</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>2918</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>Montenegro</td>
      <td>2020-04-12 23:17:00</td>
      <td>42.708678</td>
      <td>19.374390</td>
      <td>272</td>
      <td>3</td>
      <td>5</td>
      <td>264</td>
      <td>Montenegro</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>2919</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>Morocco</td>
      <td>2020-04-12 23:17:00</td>
      <td>31.791700</td>
      <td>-7.092600</td>
      <td>1661</td>
      <td>118</td>
      <td>177</td>
      <td>1366</td>
      <td>Morocco</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>2920</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>Mozambique</td>
      <td>2020-04-12 23:17:00</td>
      <td>-18.665695</td>
      <td>35.529562</td>
      <td>21</td>
      <td>0</td>
      <td>2</td>
      <td>19</td>
      <td>Mozambique</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>2921</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>Namibia</td>
      <td>2020-04-12 23:17:00</td>
      <td>-22.957600</td>
      <td>18.490400</td>
      <td>16</td>
      <td>0</td>
      <td>3</td>
      <td>13</td>
      <td>Namibia</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>2922</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>Nepal</td>
      <td>2020-04-12 23:17:00</td>
      <td>28.166700</td>
      <td>84.250000</td>
      <td>12</td>
      <td>0</td>
      <td>1</td>
      <td>11</td>
      <td>Nepal</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>2923</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>Netherlands</td>
      <td>2020-04-12 23:17:00</td>
      <td>52.132600</td>
      <td>5.291300</td>
      <td>25587</td>
      <td>2737</td>
      <td>250</td>
      <td>22600</td>
      <td>Netherlands</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>2924</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>New Zealand</td>
      <td>2020-04-12 23:17:00</td>
      <td>-40.900600</td>
      <td>174.886000</td>
      <td>1330</td>
      <td>4</td>
      <td>471</td>
      <td>855</td>
      <td>New Zealand</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>2925</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>Nicaragua</td>
      <td>2020-04-12 23:17:00</td>
      <td>12.865416</td>
      <td>-85.207229</td>
      <td>9</td>
      <td>1</td>
      <td>4</td>
      <td>4</td>
      <td>Nicaragua</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>2926</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>Niger</td>
      <td>2020-04-12 23:17:00</td>
      <td>17.607789</td>
      <td>8.081666</td>
      <td>529</td>
      <td>12</td>
      <td>75</td>
      <td>442</td>
      <td>Niger</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>2927</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>Nigeria</td>
      <td>2020-04-12 23:17:00</td>
      <td>9.082000</td>
      <td>8.675300</td>
      <td>323</td>
      <td>10</td>
      <td>85</td>
      <td>228</td>
      <td>Nigeria</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>2928</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>North Macedonia</td>
      <td>2020-04-12 23:17:00</td>
      <td>41.608600</td>
      <td>21.745300</td>
      <td>828</td>
      <td>34</td>
      <td>41</td>
      <td>753</td>
      <td>North Macedonia</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>2929</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>Norway</td>
      <td>2020-04-12 23:17:00</td>
      <td>60.472000</td>
      <td>8.468900</td>
      <td>6525</td>
      <td>128</td>
      <td>32</td>
      <td>6365</td>
      <td>Norway</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>2930</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>Oman</td>
      <td>2020-04-12 23:17:00</td>
      <td>21.512583</td>
      <td>55.923255</td>
      <td>599</td>
      <td>4</td>
      <td>109</td>
      <td>486</td>
      <td>Oman</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>2931</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>Pakistan</td>
      <td>2020-04-12 23:17:00</td>
      <td>30.375300</td>
      <td>69.345100</td>
      <td>5230</td>
      <td>91</td>
      <td>1028</td>
      <td>4111</td>
      <td>Pakistan</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>2932</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>Panama</td>
      <td>2020-04-12 23:17:00</td>
      <td>8.538000</td>
      <td>-80.782100</td>
      <td>3234</td>
      <td>79</td>
      <td>23</td>
      <td>3132</td>
      <td>Panama</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>2933</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>Papua New Guinea</td>
      <td>2020-04-12 23:17:00</td>
      <td>-6.314993</td>
      <td>143.955550</td>
      <td>2</td>
      <td>0</td>
      <td>0</td>
      <td>2</td>
      <td>Papua New Guinea</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>2934</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>Paraguay</td>
      <td>2020-04-12 23:17:00</td>
      <td>-23.442500</td>
      <td>-58.443800</td>
      <td>134</td>
      <td>6</td>
      <td>22</td>
      <td>106</td>
      <td>Paraguay</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>2935</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>Peru</td>
      <td>2020-04-12 23:17:00</td>
      <td>-9.190000</td>
      <td>-75.015200</td>
      <td>7519</td>
      <td>193</td>
      <td>1798</td>
      <td>5528</td>
      <td>Peru</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>2936</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>Philippines</td>
      <td>2020-04-12 23:17:00</td>
      <td>12.879721</td>
      <td>121.774017</td>
      <td>4648</td>
      <td>297</td>
      <td>197</td>
      <td>4154</td>
      <td>Philippines</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>2937</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>Poland</td>
      <td>2020-04-12 23:17:00</td>
      <td>51.919400</td>
      <td>19.145100</td>
      <td>6674</td>
      <td>232</td>
      <td>439</td>
      <td>6003</td>
      <td>Poland</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>2938</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>Portugal</td>
      <td>2020-04-12 23:17:00</td>
      <td>39.399900</td>
      <td>-8.224500</td>
      <td>16585</td>
      <td>504</td>
      <td>277</td>
      <td>15804</td>
      <td>Portugal</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>2939</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>Qatar</td>
      <td>2020-04-12 23:17:00</td>
      <td>25.354800</td>
      <td>51.183900</td>
      <td>2979</td>
      <td>7</td>
      <td>275</td>
      <td>2697</td>
      <td>Qatar</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>2940</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>Romania</td>
      <td>2020-04-12 23:17:00</td>
      <td>45.943200</td>
      <td>24.966800</td>
      <td>6300</td>
      <td>316</td>
      <td>852</td>
      <td>5132</td>
      <td>Romania</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>2941</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>Russia</td>
      <td>2020-04-12 23:17:00</td>
      <td>61.524010</td>
      <td>105.318756</td>
      <td>15770</td>
      <td>130</td>
      <td>1291</td>
      <td>14349</td>
      <td>Russia</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>2942</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>Rwanda</td>
      <td>2020-04-12 23:17:00</td>
      <td>-1.940300</td>
      <td>29.873900</td>
      <td>126</td>
      <td>0</td>
      <td>25</td>
      <td>101</td>
      <td>Rwanda</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>2943</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>Saint Kitts and Nevis</td>
      <td>2020-04-12 23:17:00</td>
      <td>17.357822</td>
      <td>-62.782998</td>
      <td>12</td>
      <td>0</td>
      <td>0</td>
      <td>12</td>
      <td>Saint Kitts and Nevis</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>2944</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>Saint Lucia</td>
      <td>2020-04-12 23:17:00</td>
      <td>13.909400</td>
      <td>-60.978900</td>
      <td>15</td>
      <td>0</td>
      <td>4</td>
      <td>11</td>
      <td>Saint Lucia</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>2945</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>Saint Vincent and the Grenadines</td>
      <td>2020-04-12 23:17:00</td>
      <td>12.984300</td>
      <td>-61.287200</td>
      <td>12</td>
      <td>0</td>
      <td>1</td>
      <td>11</td>
      <td>Saint Vincent and the Grenadines</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>2946</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>San Marino</td>
      <td>2020-04-12 23:17:00</td>
      <td>43.942400</td>
      <td>12.457800</td>
      <td>356</td>
      <td>35</td>
      <td>53</td>
      <td>268</td>
      <td>San Marino</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>2947</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>Sao Tome and Principe</td>
      <td>2020-04-12 23:17:00</td>
      <td>0.186360</td>
      <td>6.613081</td>
      <td>4</td>
      <td>0</td>
      <td>0</td>
      <td>4</td>
      <td>Sao Tome and Principe</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>2948</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>Saudi Arabia</td>
      <td>2020-04-12 23:17:00</td>
      <td>23.885942</td>
      <td>45.079162</td>
      <td>4462</td>
      <td>59</td>
      <td>761</td>
      <td>3642</td>
      <td>Saudi Arabia</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>2949</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>Senegal</td>
      <td>2020-04-12 23:17:00</td>
      <td>14.497400</td>
      <td>-14.452400</td>
      <td>280</td>
      <td>2</td>
      <td>171</td>
      <td>107</td>
      <td>Senegal</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>2950</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>Serbia</td>
      <td>2020-04-12 23:17:00</td>
      <td>44.016500</td>
      <td>21.005900</td>
      <td>3630</td>
      <td>80</td>
      <td>0</td>
      <td>3550</td>
      <td>Serbia</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>2951</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>Seychelles</td>
      <td>2020-04-12 23:17:00</td>
      <td>-4.679600</td>
      <td>55.492000</td>
      <td>11</td>
      <td>0</td>
      <td>0</td>
      <td>11</td>
      <td>Seychelles</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>2952</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>Sierra Leone</td>
      <td>2020-04-12 23:17:00</td>
      <td>8.460555</td>
      <td>-11.779889</td>
      <td>10</td>
      <td>0</td>
      <td>0</td>
      <td>10</td>
      <td>Sierra Leone</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>2953</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>Singapore</td>
      <td>2020-04-12 23:17:00</td>
      <td>1.283300</td>
      <td>103.833300</td>
      <td>2532</td>
      <td>8</td>
      <td>560</td>
      <td>1964</td>
      <td>Singapore</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>2954</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>Slovakia</td>
      <td>2020-04-12 23:17:00</td>
      <td>48.669000</td>
      <td>19.699000</td>
      <td>742</td>
      <td>2</td>
      <td>23</td>
      <td>717</td>
      <td>Slovakia</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>2955</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>Slovenia</td>
      <td>2020-04-12 23:17:00</td>
      <td>46.151200</td>
      <td>14.995500</td>
      <td>1205</td>
      <td>53</td>
      <td>150</td>
      <td>1002</td>
      <td>Slovenia</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>2956</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>Somalia</td>
      <td>2020-04-12 23:17:00</td>
      <td>5.152149</td>
      <td>46.199616</td>
      <td>25</td>
      <td>1</td>
      <td>2</td>
      <td>22</td>
      <td>Somalia</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>2957</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>South Africa</td>
      <td>2020-04-12 23:17:00</td>
      <td>-30.559500</td>
      <td>22.937500</td>
      <td>2173</td>
      <td>25</td>
      <td>410</td>
      <td>1738</td>
      <td>South Africa</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>2958</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>South Sudan</td>
      <td>2020-04-12 23:17:00</td>
      <td>6.877000</td>
      <td>31.307000</td>
      <td>4</td>
      <td>0</td>
      <td>0</td>
      <td>4</td>
      <td>South Sudan</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>2959</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>Spain</td>
      <td>2020-04-12 23:17:00</td>
      <td>40.463667</td>
      <td>-3.749220</td>
      <td>166831</td>
      <td>17209</td>
      <td>62391</td>
      <td>87231</td>
      <td>Spain</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>2960</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>Sri Lanka</td>
      <td>2020-04-12 23:17:00</td>
      <td>7.873054</td>
      <td>80.771797</td>
      <td>210</td>
      <td>7</td>
      <td>56</td>
      <td>147</td>
      <td>Sri Lanka</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>2961</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>Sudan</td>
      <td>2020-04-12 23:17:00</td>
      <td>12.862800</td>
      <td>30.217600</td>
      <td>19</td>
      <td>2</td>
      <td>2</td>
      <td>15</td>
      <td>Sudan</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>2962</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>Suriname</td>
      <td>2020-04-12 23:17:00</td>
      <td>3.919300</td>
      <td>-56.027800</td>
      <td>10</td>
      <td>1</td>
      <td>4</td>
      <td>5</td>
      <td>Suriname</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>2963</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>Sweden</td>
      <td>2020-04-12 23:17:00</td>
      <td>60.128161</td>
      <td>18.643501</td>
      <td>10483</td>
      <td>899</td>
      <td>381</td>
      <td>9203</td>
      <td>Sweden</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>2964</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>Switzerland</td>
      <td>2020-04-12 23:17:00</td>
      <td>46.818200</td>
      <td>8.227500</td>
      <td>25415</td>
      <td>1106</td>
      <td>12700</td>
      <td>11609</td>
      <td>Switzerland</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>2965</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>Syria</td>
      <td>2020-04-12 23:17:00</td>
      <td>34.802075</td>
      <td>38.996815</td>
      <td>25</td>
      <td>2</td>
      <td>5</td>
      <td>18</td>
      <td>Syria</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>2966</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>Taiwan*</td>
      <td>2020-04-12 07:18:00</td>
      <td>23.700000</td>
      <td>121.000000</td>
      <td>388</td>
      <td>6</td>
      <td>109</td>
      <td>273</td>
      <td>Taiwan*</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>2967</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>Tanzania</td>
      <td>2020-04-12 23:17:00</td>
      <td>-6.369028</td>
      <td>34.888822</td>
      <td>32</td>
      <td>3</td>
      <td>5</td>
      <td>24</td>
      <td>Tanzania</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>2968</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>Thailand</td>
      <td>2020-04-12 23:17:00</td>
      <td>15.870032</td>
      <td>100.992541</td>
      <td>2551</td>
      <td>38</td>
      <td>1218</td>
      <td>1295</td>
      <td>Thailand</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>2969</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>Timor-Leste</td>
      <td>2020-04-12 23:17:00</td>
      <td>-8.874217</td>
      <td>125.727539</td>
      <td>2</td>
      <td>0</td>
      <td>1</td>
      <td>1</td>
      <td>Timor-Leste</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>2970</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>Togo</td>
      <td>2020-04-12 23:17:00</td>
      <td>8.619500</td>
      <td>0.824800</td>
      <td>76</td>
      <td>3</td>
      <td>29</td>
      <td>44</td>
      <td>Togo</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>2971</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>Trinidad and Tobago</td>
      <td>2020-04-12 23:17:00</td>
      <td>10.691800</td>
      <td>-61.222500</td>
      <td>113</td>
      <td>8</td>
      <td>16</td>
      <td>89</td>
      <td>Trinidad and Tobago</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>2972</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>Tunisia</td>
      <td>2020-04-12 23:17:00</td>
      <td>33.886917</td>
      <td>9.537499</td>
      <td>707</td>
      <td>31</td>
      <td>43</td>
      <td>633</td>
      <td>Tunisia</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>2973</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>Turkey</td>
      <td>2020-04-12 23:17:00</td>
      <td>38.963700</td>
      <td>35.243300</td>
      <td>56956</td>
      <td>1198</td>
      <td>3446</td>
      <td>52312</td>
      <td>Turkey</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>2974</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>Uganda</td>
      <td>2020-04-12 23:17:00</td>
      <td>1.373333</td>
      <td>32.290275</td>
      <td>54</td>
      <td>0</td>
      <td>4</td>
      <td>50</td>
      <td>Uganda</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>2975</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>Ukraine</td>
      <td>2020-04-12 23:17:00</td>
      <td>48.379400</td>
      <td>31.165600</td>
      <td>2777</td>
      <td>83</td>
      <td>89</td>
      <td>2605</td>
      <td>Ukraine</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>2976</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>United Arab Emirates</td>
      <td>2020-04-12 23:17:00</td>
      <td>23.424076</td>
      <td>53.847818</td>
      <td>4123</td>
      <td>22</td>
      <td>680</td>
      <td>3421</td>
      <td>United Arab Emirates</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>2977</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>United Kingdom</td>
      <td>2020-04-12 23:17:00</td>
      <td>55.378100</td>
      <td>-3.436000</td>
      <td>84279</td>
      <td>10612</td>
      <td>344</td>
      <td>73323</td>
      <td>United Kingdom</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>2978</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>Uruguay</td>
      <td>2020-04-12 23:17:00</td>
      <td>-32.522800</td>
      <td>-55.765800</td>
      <td>480</td>
      <td>7</td>
      <td>231</td>
      <td>242</td>
      <td>Uruguay</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>2979</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>Uzbekistan</td>
      <td>2020-04-12 23:17:00</td>
      <td>41.377491</td>
      <td>64.585262</td>
      <td>865</td>
      <td>4</td>
      <td>66</td>
      <td>795</td>
      <td>Uzbekistan</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>2980</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>Venezuela</td>
      <td>2020-04-12 23:17:00</td>
      <td>6.423800</td>
      <td>-66.589700</td>
      <td>181</td>
      <td>9</td>
      <td>93</td>
      <td>79</td>
      <td>Venezuela</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>2981</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>Vietnam</td>
      <td>2020-04-12 23:17:00</td>
      <td>14.058324</td>
      <td>108.277199</td>
      <td>262</td>
      <td>0</td>
      <td>144</td>
      <td>118</td>
      <td>Vietnam</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>2982</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>West Bank and Gaza</td>
      <td>2020-04-12 23:17:00</td>
      <td>31.952200</td>
      <td>35.233200</td>
      <td>290</td>
      <td>2</td>
      <td>58</td>
      <td>230</td>
      <td>West Bank and Gaza</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>2983</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>Western Sahara</td>
      <td>2020-04-12 23:17:00</td>
      <td>24.215500</td>
      <td>-12.885800</td>
      <td>6</td>
      <td>0</td>
      <td>0</td>
      <td>6</td>
      <td>Western Sahara</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>2984</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>Yemen</td>
      <td>2020-04-12 23:17:00</td>
      <td>15.552727</td>
      <td>48.516388</td>
      <td>1</td>
      <td>0</td>
      <td>0</td>
      <td>1</td>
      <td>Yemen</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>2985</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>Zambia</td>
      <td>2020-04-12 23:17:00</td>
      <td>-13.133897</td>
      <td>27.849332</td>
      <td>43</td>
      <td>2</td>
      <td>30</td>
      <td>11</td>
      <td>Zambia</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>2986</th>
      <td>NaN</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>Zimbabwe</td>
      <td>2020-04-12 23:17:00</td>
      <td>-19.015438</td>
      <td>29.154857</td>
      <td>14</td>
      <td>3</td>
      <td>0</td>
      <td>11</td>
      <td>Zimbabwe</td>
      <td>2020-04-12</td>
    </tr>
    <tr>
      <th>2987</th>
      <td>NaN</td>
      <td>unassigned</td>
      <td>Utah</td>
      <td>US</td>
      <td>2020-04-12 23:18:00</td>
      <td>NaN</td>
      <td>NaN</td>
      <td>4</td>
      <td>5</td>
      <td>0</td>
      <td>-1</td>
      <td>unassigned, Utah, US</td>
      <td>2020-04-12</td>
    </tr>
  </tbody>
</table>