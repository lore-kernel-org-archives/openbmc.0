Return-Path: <tomjose@linux.vnet.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=tomjose@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zzBVB4rkjzF1qM
 for <openbmc@lists.ozlabs.org>; Sun, 11 Mar 2018 04:45:19 +1100 (AEDT)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w2AHhuFH076051
 for <openbmc@lists.ozlabs.org>; Sat, 10 Mar 2018 12:45:16 -0500
Received: from e06smtp12.uk.ibm.com (e06smtp12.uk.ibm.com [195.75.94.108])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2gmad8q120-1
 (version=TLSv1.2 cipher=AES256-SHA256 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Sat, 10 Mar 2018 12:45:16 -0500
Received: from localhost
 by e06smtp12.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <tomjose@linux.vnet.ibm.com>;
 Sat, 10 Mar 2018 17:45:14 -0000
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp12.uk.ibm.com (192.168.101.142) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Sat, 10 Mar 2018 17:45:11 -0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w2AHjAJ063111230; Sat, 10 Mar 2018 17:45:10 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 10BCF52045;
 Sat, 10 Mar 2018 16:36:45 +0000 (GMT)
Received: from [9.79.221.48] (unknown [9.79.221.48])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTPS id 88A015203F;
 Sat, 10 Mar 2018 16:36:43 +0000 (GMT)
Subject: Re: Sensor readings as 1-byte
To: guhan balasubramanian <guhan.sac@gmail.com>, openbmc@lists.ozlabs.org
References: <CAMNAJg3dMki4zJhDyAFfJndwo_j8NA7UjTek0LUD3SCMfQwf1w@mail.gmail.com>
From: Tom Joseph <tomjose@linux.vnet.ibm.com>
Date: Sat, 10 Mar 2018 23:15:05 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <CAMNAJg3dMki4zJhDyAFfJndwo_j8NA7UjTek0LUD3SCMfQwf1w@mail.gmail.com>
Content-Type: multipart/alternative;
 boundary="------------29F18462FDE6134D825E00DB"
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 18031017-0008-0000-0000-000004DA435E
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18031017-0009-0000-0000-00001E6D6AE8
Message-Id: <e3a470db-4dc1-3e84-dc73-3be2549d6fa7@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2018-03-10_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1803100215
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Sat, 10 Mar 2018 17:45:23 -0000

This is a multi-part message in MIME format.
--------------29F18462FDE6134D825E00DB
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello Guhan,

The updated sensor-example.yaml has the Rexp field as well. These values 
are  calculated based on the minimum and maximum value of the sensor.

If a temperature sensor has a range of -127 - +128, means y is -127 to 
+128 and the range of x is 0-255.
By substituting x = 0 and y = -127 (k2 is the decimal precision and 
assume in this case as whole nos) implies Bexp = -127.
Similarly substitute x = 255 and y = 128 and M is evaluated as 1.

Regards,
Tom

On Saturday 10 March 2018 08:01 AM, guhan balasubramanian wrote:
> Hi,
>
> According to the IPMI spec, we represent all sensor readings (Volt, 
> Temp, Amp, etc.) as 1-byte.
>
> Since we represent them as 1-byte, we use a linearization formula to 
> convert to actual value as follows:
>
> y = (M*x + B*10^(k1))*10^(k2)
>
> where x is the 1-byte value that is filled in the get sensor reading 
> command.
>
> We see in the ipmitool example on how an example of 3.36 V is 
> represented as 1-byte.
> https://computercheese.blogspot.com/2013/10/ipmi-sensor-reading-conversion-formula.html?q=sensor
>
> Can any one please help on how the values for M, B, k1 and k2 are 
> populated for each sensor?
>
> In the openbmc repo, I believe these values are present in the 
> config.yaml of phosphor-ipmi-sensor-inventory (based on the following 
> sample).
>
> 0xF1:
>   sensorType: 0x01
>   path: /xyz/openbmc_project/sensors/temperature/temp1
>   sensorReadingType: 0x01
> *multiplierM*: 511
> *offsetB*: 0
> *bExp*: 0
>   mutability: Mutability::Write|Mutability::Read
>   serviceInterface: org.freedesktop.DBus.Properties
>   readingType: readingData
>   interfaces:
>     xyz.openbmc_project.Sensor.Value:
>       Value:
>         Offsets:
>           0x0:
>             type: int64_t
>
>
> Thanks,
> Guhan
>


--------------29F18462FDE6134D825E00DB
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>Hello Guhan,</p>
    The updated sensor-example.yaml has the Rexp field as well. These
    values are  calculated based on the minimum and maximum value of the
    sensor.<br>
    <br>
    If a temperature sensor has a range of -127 - +128, means y is -127
    to +128 and the range of x is 0-255.<br>
    By substituting x = 0 and y = -127 (k2 is the decimal precision and
    assume in this case as whole nos) implies Bexp = -127.<br>
    Similarly substitute x = 255 and y = 128 and M is evaluated as 1. <br>
    <br>
    Regards,<br>
    Tom<br>
    <br>
    <div class="moz-cite-prefix">On Saturday 10 March 2018 08:01 AM,
      guhan balasubramanian wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAMNAJg3dMki4zJhDyAFfJndwo_j8NA7UjTek0LUD3SCMfQwf1w@mail.gmail.com">
      <div dir="ltr">Hi,
        <div><br>
        </div>
        <div>According to the IPMI spec, we represent all sensor
          readings (Volt, Temp, Amp, etc.) as 1-byte. </div>
        <div><br>
        </div>
        <div>Since we represent them as 1-byte, we use a linearization
          formula to convert to actual value as follows:</div>
        <div><br>
        </div>
        <div>y = (M*x + B*10^(k1))*10^(k2)</div>
        <div><br>
        </div>
        <div>where x is the 1-byte value that is filled in the get
          sensor reading command.</div>
        <div><br>
        </div>
        <div>We see in the ipmitool example on how an example of 3.36 V
          is represented as 1-byte. </div>
        <div><a
href="https://computercheese.blogspot.com/2013/10/ipmi-sensor-reading-conversion-formula.html?q=sensor"
            moz-do-not-send="true">https://computercheese.blogspot.com/2013/10/ipmi-sensor-reading-conversion-formula.html?q=sensor</a></div>
        <div><br>
        </div>
        <div>Can any one please help on how the values for M, B, k1 and
          k2 are populated for each sensor? </div>
        <div><br>
        </div>
        <div>In the openbmc repo, I believe these values are present in
          the config.yaml of phosphor-ipmi-sensor-inventory (based on
          the following sample). </div>
        <div><br>
        </div>
        <div>
          <div>0xF1:</div>
          <div>  sensorType: 0x01</div>
          <div>  path: /xyz/openbmc_project/sensors/temperature/temp1</div>
          <div>  sensorReadingType: 0x01</div>
          <div>  <b>multiplierM</b>: 511</div>
          <div>  <b>offsetB</b>: 0</div>
          <div>  <b>bExp</b>: 0</div>
          <div>  mutability: Mutability::Write|Mutability::Read</div>
          <div>  serviceInterface: org.freedesktop.DBus.Properties</div>
          <div>  readingType: readingData</div>
          <div>  interfaces:</div>
          <div>    xyz.openbmc_project.Sensor.Value:</div>
          <div>      Value:</div>
          <div>        Offsets:</div>
          <div>          0x0:</div>
          <div>            type: int64_t</div>
        </div>
        <div>
          <table class="gmail-highlight gmail-tab-size
            gmail-js-file-line-container"
style="box-sizing:border-box;border-collapse:collapse;color:rgb(36,41,46);font-family:-apple-system,system-ui,&quot;Segoe
            UI&quot;,Helvetica,Arial,sans-serif,&quot;Apple Color
            Emoji&quot;,&quot;Segoe UI Emoji&quot;,&quot;Segoe UI
Symbol&quot;;font-size:14px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:initial">
            <tbody style="box-sizing:border-box">
              <tr style="box-sizing:border-box">
                <td id="gmail-LC18" class="gmail-blob-code gmail-blob-code-inner gmail-js-file-line" style="box-sizing:border-box;padding:0px 10px;line-height:20px;vertical-align:top;overflow:visible;font-family:SFMono-Regular,Consolas,&quot;Liberation Mono&quot;,Menlo,Courier,monospace;font-size:12px;color:rgb(36,41,46);word-wrap:normal;white-space:pre">
</td>
              </tr>
            </tbody>
          </table>
          <br>
        </div>
        <div>Thanks,</div>
        <div>Guhan</div>
        <div><br>
        </div>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------29F18462FDE6134D825E00DB--
