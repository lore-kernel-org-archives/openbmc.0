Return-Path: <mspinler@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3srLDK29VHzDrVW
 for <openbmc@lists.ozlabs.org>; Sat,  8 Oct 2016 07:08:00 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id
 u97K4Dc9066749
 for <openbmc@lists.ozlabs.org>; Fri, 7 Oct 2016 16:07:58 -0400
Received: from e37.co.us.ibm.com (e37.co.us.ibm.com [32.97.110.158])
 by mx0a-001b2d01.pphosted.com with ESMTP id 25xcb2fbr8-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 07 Oct 2016 16:07:58 -0400
Received: from localhost
 by e37.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <mspinler@linux.vnet.ibm.com>;
 Fri, 7 Oct 2016 14:07:57 -0600
Received: from d03dlp01.boulder.ibm.com (9.17.202.177)
 by e37.co.us.ibm.com (192.168.1.137) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Fri, 7 Oct 2016 14:07:55 -0600
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25])
 by d03dlp01.boulder.ibm.com (Postfix) with ESMTP id 1E2491FF001F;
 Fri,  7 Oct 2016 14:07:35 -0600 (MDT)
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u97K7rPb12779860; Fri, 7 Oct 2016 20:07:53 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 613862803E;
 Fri,  7 Oct 2016 16:07:53 -0400 (EDT)
Received: from [9.10.223.205] (unknown [9.10.223.205])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP id 1D7F62804C;
 Fri,  7 Oct 2016 16:07:53 -0400 (EDT)
Subject: Re: I2C device driver names
To: Milton Miller II <miltonm@us.ibm.com>, Joel Stanley <joel@jms.id.au>
References: <CACPK8XdPfy7jN6ejsN=w_4wejy2zxBpwb8M3+b0GoLaW=0cKMw@mail.gmail.com>
 <b659d152-5481-193e-ce1b-520d3de7d2ba@linux.vnet.ibm.com>
 <OF26A8D55C.BC71B175-ON00258045.000161A7-00258045.00024159@notes.na.collabserv.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
From: Matt Spinler <mspinler@linux.vnet.ibm.com>
Date: Fri, 7 Oct 2016 15:08:09 -0500
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <OF26A8D55C.BC71B175-ON00258045.000161A7-00258045.00024159@notes.na.collabserv.com>
Content-Type: multipart/alternative;
 boundary="------------8214134E73D6310AE9B39A50"
X-TM-AS-GCONF: 00
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16100720-0024-0000-0000-000014BD6039
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00005869; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000186; SDB=6.00765610; UDB=6.00365868; IPR=6.00541479; 
 BA=6.00004792; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00012910; XFM=3.00000011;
 UTC=2016-10-07 20:07:56
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 16100720-0025-0000-0000-0000452394EF
Message-Id: <491b910f-a8ab-e70f-4055-928fbd4a7b1f@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2016-10-07_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1609300000
 definitions=main-1610070345
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
X-List-Received-Date: Fri, 07 Oct 2016 20:08:01 -0000

This is a multi-part message in MIME format.
--------------8214134E73D6310AE9B39A50
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Thanks.  I opened the following issues:

Power supply:  https://github.com/openbmc/openbmc/issues/651

MAX31785: https://github.com/openbmc/openbmc/issues/652

UCD90160: https://github.com/openbmc/openbmc/issues/653

RX8900CE: https://github.com/openbmc/openbmc/issues/654



On 10/6/2016 7:24 PM, Milton Miller II wrote:
>
> On 10/06/2016 about 06:43PM somewhere, Joel Stanley <joel@jms.id.au 
> <mailto:joel@jms.id.au>> wrote:
> >
> >On Fri, Oct 7, 2016 at 7:14 AM, Matt Spinler
> ><mspinler@linux.vnet.ibm.com <mailto:mspinler@linux.vnet.ibm.com>> wrote:
> >> Hi,
> >>
> >> As part of my work to generate a device tree from the machine
> >readable
> >> workbook XML, I need to create I2C device entries, which have the
> >compatible
> >> properties that need to be filled in.
> >>
> >> The following parts are present in the system I'm trying to build,
> >with
> >> firmware requirements to access them. I took a stab at the names.
> >Could
> >> someone doublecheck them and maybe comment on if a driver is
> >missing, or
> >> maybe if some upcoming work is known that will include it? I
> >didn't have
> >> much luck finding a lot of these in the
> >Documentation/devicetree/bindings
> >> directories.
>
> Unique to the i2c subsystem, i2c devices will also match when
> the vendor is different but the chip name portion matches.
>
> >
> >If they're not in the kernel tree it could mean there is not a driver
> >for them, or that they are supported as part of the trivial device
> >bindings.
> >
> >>
> >> PMBus Power supplies: ?
> >>
> >> MAX31785 fan controller: max,max31785
>
> Maxim for the vendor? see
> Documentation/devicetree/bindings/vendor-prefixes.txt
>
> >
> >Doesn't appear to be an upstream driver. Please open a ticket.
> >
> >>
> >> BMP280: bosch,bmp280
> >
> >Supported by the iio bmp280 driver.
> >
> >>
> >> TMP4523A temp sensor: ti,tmp423
> >
> >Supported by the tmp421 hwmon driver.
> >
> >>
> >> TMP275 temp sensor: ti,tmp275
> >
> >Documentation/devicetree/bindings/i2c/trivial-devices.txt
> >
> >Supported by the lm75 hwmon driver.
> >
> >> pca9552 IO expander: nxp,pca9552
> >
> >This appears to be a LED driver?
> >
> >There's a LED device driver called leds-pca955x.
>
> There is also a gpio driver for pca955[4567] in pca953x.c.
>
> >
> >>
> >> UCD90160 power sequencer: ti,ucd90160
> >
> >A kernel driver called ucd9000 appears to support similar chips.
> >Please open a ticket.
> >
> >>
> >> RX8900CE RTC: epson,rx8900ce
> >
> >No upstream driver. Please open a ticket.
> >
> >>
> >> 24c64 EEPROM: atmel,24c64
> >
> >LGTM.
> >
> >Cheers,
> >
> >Joel
> >
> >>
> >> There are also a handful of regulators, but so far I haven't heard
> >of any
> >> requirements to access them.
> >>
> >> Thanks.
>
>
>


--------------8214134E73D6310AE9B39A50
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <p>Thanks.  I opened the following issues:</p>
    <p>Power supply:  <a class="moz-txt-link-freetext" href="https://github.com/openbmc/openbmc/issues/651">https://github.com/openbmc/openbmc/issues/651</a></p>
    <p>MAX31785: <a class="moz-txt-link-freetext" href="https://github.com/openbmc/openbmc/issues/652">https://github.com/openbmc/openbmc/issues/652</a></p>
    <p>UCD90160: <a class="moz-txt-link-freetext" href="https://github.com/openbmc/openbmc/issues/653">https://github.com/openbmc/openbmc/issues/653</a></p>
    <p>RX8900CE: <a class="moz-txt-link-freetext" href="https://github.com/openbmc/openbmc/issues/654">https://github.com/openbmc/openbmc/issues/654</a></p>
    <p><br>
    </p>
    <br>
    <div class="moz-cite-prefix">On 10/6/2016 7:24 PM, Milton Miller II
      wrote:<br>
    </div>
    <blockquote
cite="mid:OF26A8D55C.BC71B175-ON00258045.000161A7-00258045.00024159@notes.na.collabserv.com"
      type="cite"><font face="Default Sans
        Serif,Verdana,Arial,Helvetica,sans-serif" size="2"><br>
        On 10/06/2016 about 06:43PM somewhere, Joel Stanley &lt;<a
          moz-do-not-send="true" href="mailto:joel@jms.id.au"
          target="_blank">joel@jms.id.au</a>&gt; wrote:<br>
        &gt;<br>
        &gt;On Fri, Oct 7, 2016 at 7:14 AM, Matt Spinler<br>
        &gt;&lt;<a moz-do-not-send="true"
          href="mailto:mspinler@linux.vnet.ibm.com" target="_blank">mspinler@linux.vnet.ibm.com</a>&gt;
        wrote:<br>
        &gt;&gt; Hi,<br>
        &gt;&gt;<br>
        &gt;&gt; As part of my work to generate a device tree from the
        machine<br>
        &gt;readable<br>
        &gt;&gt; workbook XML, I need to create I2C device entries,
        which have the<br>
        &gt;compatible<br>
        &gt;&gt; properties that need to be filled in.<br>
        &gt;&gt;<br>
        &gt;&gt; The following parts are present in the system I'm
        trying to build,<br>
        &gt;with<br>
        &gt;&gt; firmware requirements to access them. I took a stab at
        the names.<br>
        &gt;Could<br>
        &gt;&gt; someone doublecheck them and maybe comment on if a
        driver is<br>
        &gt;missing, or<br>
        &gt;&gt; maybe if some upcoming work is known that will include
        it? I<br>
        &gt;didn't have<br>
        &gt;&gt; much luck finding a lot of these in the<br>
        &gt;Documentation/devicetree/bindings<br>
        &gt;&gt; directories.<br>
        <br>
        Unique to the i2c subsystem, i2c devices will also match when <br>
        the vendor is different but the chip name portion matches.<br>
        <br>
        &gt;<br>
        &gt;If they're not in the kernel tree it could mean there is not
        a driver<br>
        &gt;for them, or that they are supported as part of the trivial
        device<br>
        &gt;bindings.<br>
        &gt;<br>
        &gt;&gt;<br>
        &gt;&gt; PMBus Power supplies: ?<br>
        &gt;&gt;<br>
        &gt;&gt; MAX31785 fan controller: max,max31785<br>
        <br>
        Maxim for the vendor? see <br>
        Documentation/devicetree/bindings/vendor-prefixes.txt<br>
        <br>
        &gt;<br>
        &gt;Doesn't appear to be an upstream driver. Please open a
        ticket.<br>
        &gt;<br>
        &gt;&gt;<br>
        &gt;&gt; BMP280: bosch,bmp280<br>
        &gt;<br>
        &gt;Supported by the iio bmp280 driver.<br>
        &gt;<br>
        &gt;&gt;<br>
        &gt;&gt; TMP4523A temp sensor: ti,tmp423<br>
        &gt;<br>
        &gt;Supported by the tmp421 hwmon driver.<br>
        &gt;<br>
        &gt;&gt;<br>
        &gt;&gt; TMP275 temp sensor: ti,tmp275<br>
        &gt;<br>
        &gt;Documentation/devicetree/bindings/i2c/trivial-devices.txt<br>
        &gt;<br>
        &gt;Supported by the lm75 hwmon driver.<br>
        &gt;<br>
        &gt;&gt; pca9552 IO expander: nxp,pca9552<br>
        &gt;<br>
        &gt;This appears to be a LED driver?<br>
        &gt;<br>
        &gt;There's a LED device driver called leds-pca955x.<br>
        <br>
        There is also a gpio driver for pca955[4567] in pca953x.c.<br>
        <br>
        &gt;<br>
        &gt;&gt;<br>
        &gt;&gt; UCD90160 power sequencer: ti,ucd90160<br>
        &gt;<br>
        &gt;A kernel driver called ucd9000 appears to support similar
        chips.<br>
        &gt;Please open a ticket.<br>
        &gt;<br>
        &gt;&gt;<br>
        &gt;&gt; RX8900CE RTC: epson,rx8900ce<br>
        &gt;<br>
        &gt;No upstream driver. Please open a ticket.<br>
        &gt;<br>
        &gt;&gt;<br>
        &gt;&gt; 24c64 EEPROM: atmel,24c64<br>
        &gt;<br>
        &gt;LGTM.<br>
        &gt;<br>
        &gt;Cheers,<br>
        &gt;<br>
        &gt;Joel<br>
        &gt;<br>
        &gt;&gt;<br>
        &gt;&gt; There are also a handful of regulators, but so far I
        haven't heard<br>
        &gt;of any<br>
        &gt;&gt; requirements to access them.<br>
        &gt;&gt;<br>
        &gt;&gt; Thanks.<br>
        <br>
        <br>
      </font><br>
    </blockquote>
    <br>
  </body>
</html>

--------------8214134E73D6310AE9B39A50--
