Return-Path: <mspinler@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tzMmV1ZGmzDqKD
 for <openbmc@lists.ozlabs.org>; Thu, 12 Jan 2017 08:42:01 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id
 v0BLcq49123748
 for <openbmc@lists.ozlabs.org>; Wed, 11 Jan 2017 16:41:59 -0500
Received: from e38.co.us.ibm.com (e38.co.us.ibm.com [32.97.110.159])
 by mx0a-001b2d01.pphosted.com with ESMTP id 27wqa2y0st-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 11 Jan 2017 16:41:59 -0500
Received: from localhost
 by e38.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <mspinler@linux.vnet.ibm.com>;
 Wed, 11 Jan 2017 14:41:58 -0700
Received: from d03dlp02.boulder.ibm.com (9.17.202.178)
 by e38.co.us.ibm.com (192.168.1.138) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Wed, 11 Jan 2017 14:41:57 -0700
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by d03dlp02.boulder.ibm.com (Postfix) with ESMTP id C43603E4004F;
 Wed, 11 Jan 2017 14:41:56 -0700 (MST)
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v0BLfuOO11010546; Wed, 11 Jan 2017 14:41:56 -0700
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A7C4678041;
 Wed, 11 Jan 2017 14:41:56 -0700 (MST)
Received: from [9.10.99.159] (unknown [9.10.99.159])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP id 6B4FC78037;
 Wed, 11 Jan 2017 14:41:56 -0700 (MST)
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
From: Matt Spinler <mspinler@linux.vnet.ibm.com>
Subject: Witherspoon I2C device tree entries
Date: Wed, 11 Jan 2017 15:42:09 -0600
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.5.1
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary="------------A91810CBA09ABBDE5DF3553C"
X-TM-AS-GCONF: 00
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 17011121-0028-0000-0000-0000066E37B4
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00006416; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000199; SDB=6.00806311; UDB=6.00392366; IPR=6.00583646; 
 BA=6.00005049; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00013897; XFM=3.00000011;
 UTC=2017-01-11 21:41:58
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17011121-0029-0000-0000-0000324EEE41
Message-Id: <aa89e020-ddda-286a-6a5b-adaade645215@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-01-11_17:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1612050000
 definitions=main-1701110288
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 11 Jan 2017 21:42:02 -0000

This is a multi-part message in MIME format.
--------------A91810CBA09ABBDE5DF3553C
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Joel,

I have some new Witherspoon device tree entries for I2C devices and 
LEDs.  Could you add these to the in-tree dts?  I'm not sure what would 
need to go into witherspoon.cfg to enable them.

     leds {
         compatible = "gpio-leds";

         rear-fault-led {
             gpios = <&gpio ASPEED_GPIO(N, 2) GPIO_ACTIVE_LOW>;
         };

         rear-id-led {
             gpios = <&gpio ASPEED_GPIO(N, 4) GPIO_ACTIVE_LOW>;
         };

         rear-power-led {
             gpios = <&gpio ASPEED_GPIO(N, 3) GPIO_ACTIVE_LOW>;
         };
     };


i2c3:
     max31785@52 {
         compatible = "maxim,max31785";
         reg = <0x52>;
     };

     pca9552@60 {
         compatible = "nxp,pca955x";
         reg = <0x60>;
     };


i2c4:
     tmp423a@4c {
         compatible = "ti,tmp423";
         reg = <0x4c>;
     };


i2c5:
     tmp423a@4c {
         compatible = "ti,tmp423";
         reg = <0x4c>;
     };


i2c9:
     tmp275@4a {
         compatible = "ti,tmp275";
         reg = <0x4a>;
     };

i2c11:
     pca9552@60 {
         compatible = "nxp,pca955x";
         reg = <0x60>;
     };

Thanks!


--------------A91810CBA09ABBDE5DF3553C
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=utf-8">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <p><font size="-1">Hi Joel,</font></p>
    <p><font size="-1">I have some new Witherspoon device tree entries
        for I2C devices and LEDs.  Could you add these to the in-tree
        dts?  I'm not sure what would need to go into witherspoon.cfg to
        enable them.<br>
      </font></p>
    <p><font size="-1">    leds {<br>
                compatible = "gpio-leds";<br>
        <br>
                rear-fault-led {<br>
                    gpios = &lt;&amp;gpio ASPEED_GPIO(N, 2)
        GPIO_ACTIVE_LOW&gt;;<br>
                };<br>
        <br>
                rear-id-led {<br>
                    gpios = &lt;&amp;gpio ASPEED_GPIO(N, 4)
        GPIO_ACTIVE_LOW&gt;;<br>
                };<br>
        <br>
                rear-power-led {<br>
                    gpios = &lt;&amp;gpio ASPEED_GPIO(N, 3)
        GPIO_ACTIVE_LOW&gt;;<br>
                };<br>
            };<br>
        <br>
        <br>
        i2c3:<br>
            max31785@52 {<br>
                compatible = "maxim,max31785";<br>
                reg = &lt;0x52&gt;;<br>
            };<br>
        <br>
            pca9552@60 {<br>
                compatible = "nxp,pca955x";<br>
                reg = &lt;0x60&gt;;<br>
            };<br>
        <br>
        <br>
        i2c4:<br>
            tmp423a@4c {<br>
                compatible = "ti,tmp423";<br>
                reg = &lt;0x4c&gt;;<br>
            };<br>
        <br>
        <br>
        i2c5:<br>
            tmp423a@4c {<br>
                compatible = "ti,tmp423";<br>
                reg = &lt;0x4c&gt;;<br>
            };<br>
        <br>
        <br>
        i2c9:<br>
            tmp275@4a {<br>
                compatible = "ti,tmp275";<br>
                reg = &lt;0x4a&gt;;<br>
            };<br>
        <br>
        i2c11:<br>
            pca9552@60 {<br>
                compatible = "nxp,pca955x";<br>
                reg = &lt;0x60&gt;;<br>
            };<br>
      </font></p>
    <p><font size="-1">Thanks!</font><br>
    </p>
  </body>
</html>

--------------A91810CBA09ABBDE5DF3553C--
