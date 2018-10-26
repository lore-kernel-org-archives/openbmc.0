Return-Path: <mspinler@linux.vnet.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=mspinler@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42hZxL2K4nzF3Ht
 for <openbmc@lists.ozlabs.org>; Sat, 27 Oct 2018 07:15:33 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w9QK8x9T167698
 for <openbmc@lists.ozlabs.org>; Fri, 26 Oct 2018 16:15:31 -0400
Received: from e34.co.us.ibm.com (e34.co.us.ibm.com [32.97.110.152])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2nc8n9jnm8-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 26 Oct 2018 16:15:30 -0400
Received: from localhost
 by e34.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <mspinler@linux.vnet.ibm.com>;
 Fri, 26 Oct 2018 14:15:29 -0600
Received: from b03cxnp08026.gho.boulder.ibm.com (9.17.130.18)
 by e34.co.us.ibm.com (192.168.1.134) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 26 Oct 2018 14:15:26 -0600
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w9QKFPkV16646206
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 26 Oct 2018 20:15:25 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5E50AC6057;
 Fri, 26 Oct 2018 20:15:25 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 32211C605A;
 Fri, 26 Oct 2018 20:15:25 +0000 (GMT)
Received: from [9.10.99.83] (unknown [9.10.99.83])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Fri, 26 Oct 2018 20:15:25 +0000 (GMT)
Subject: Re: help: OpenBMC host power on from power button press
To: "A, Maheswari" <maheswari.a@atos.net>
References: <DB7PR02MB43932ACAD795B6BB37676D1192F00@DB7PR02MB4393.eurprd02.prod.outlook.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
From: Matt Spinler <mspinler@linux.vnet.ibm.com>
Date: Fri, 26 Oct 2018 15:15:26 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <DB7PR02MB43932ACAD795B6BB37676D1192F00@DB7PR02MB4393.eurprd02.prod.outlook.com>
Content-Type: multipart/alternative;
 boundary="------------0BA18F67B02B53959EB07199"
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 18102620-0016-0000-0000-000009498F88
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00009940; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000268; SDB=6.01108389; UDB=6.00574146; IPR=6.00888476; 
 MB=3.00023922; MTD=3.00000008; XFM=3.00000015; UTC=2018-10-26 20:15:27
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18102620-0017-0000-0000-000040D98062
Message-Id: <8d187aba-eba1-f68b-17c5-62686e0227a8@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-10-26_10:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=960 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1807170000 definitions=main-1810260170
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 26 Oct 2018 20:15:34 -0000

This is a multi-part message in MIME format.
--------------0BA18F67B02B53959EB07199
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit


On 10/25/2018 11:52 PM, A, Maheswari wrote:
>
> Hi,
>
> I am new to openBMC project.
>
> We are in the process of porting power button gpio interrupt handling 
> in openBMC.
>
> After some a lot of analysis, I found that obmc-button-power related 
> service are necessary to power on the host using power button press 
> event.
>
> I have added POWER_BUTTON and machine specific GPIO number and 
> polarity in gpio_defs.json.
>
> While starting the “org.openbmc.button.Power” service, I am getting 
> the below error.
>
> *org.openbmc.buttons.Power@1.service 
> <mailto:org.openbmc.buttons.Power@1.service> - Phosphor Power Button1*
>
> *   Loaded: [[0;1;31merror[[0m (Reason: File exists)*
>
> *   Active: inactive (dead)*
>
> **
>
> *Oct 22 14:14:13 hwmi systemd[1]: 
> [[0;1;31m[[0;1;39m[[0;1;31morg.openbmc.buttons.Power@1.service: Two 
> services allocated for the same bus name org.open*
>
> *bmc.butto.Power, refusing operation.[[0m*
>
> Please help to figure out and proceed.
>

Hi Maheswari,

I'm guessing you already have an org.openbmc.buttons.Power@0.service 
running.

You can check with:

# systemctl status org.openbmc.buttons.Power@0.service

or just check for the button_power.exe process already running.


> Thanks
>
> Maheswari A
>


--------------0BA18F67B02B53959EB07199
Content-Type: text/html; charset=windows-1252
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html;
      charset=windows-1252">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <br>
    <div class="moz-cite-prefix">On 10/25/2018 11:52 PM, A, Maheswari
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:DB7PR02MB43932ACAD795B6BB37676D1192F00@DB7PR02MB4393.eurprd02.prod.outlook.com">
      <meta http-equiv="Content-Type" content="text/html;
        charset=windows-1252">
      <meta name="Generator" content="Microsoft Word 15 (filtered
        medium)">
      <style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:EN-US;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:EN-US;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext="edit" spidmax="1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext="edit">
<o:idmap v:ext="edit" data="1" />
</o:shapelayout></xml><![endif]-->
      <div class="WordSection1">
        <p class="MsoNormal">Hi, <o:p></o:p></p>
        <p class="MsoNormal"><o:p> </o:p></p>
        <p class="MsoNormal">I am new to openBMC project. <o:p></o:p></p>
        <p class="MsoNormal"><o:p> </o:p></p>
        <p class="MsoNormal">We are in the process of porting power
          button gpio interrupt handling in openBMC.
          <o:p></o:p></p>
        <p class="MsoNormal"><o:p> </o:p></p>
        <p class="MsoNormal">After some a lot of analysis, I found that
          obmc-button-power related service are necessary to power on
          the host using power button press event.
          <o:p></o:p></p>
        <p class="MsoNormal"><o:p> </o:p></p>
        <p class="MsoNormal">I have added POWER_BUTTON and machine
          specific GPIO number and polarity in gpio_defs.json.
          <o:p></o:p></p>
        <p class="MsoNormal"><o:p> </o:p></p>
        <p class="MsoNormal">While starting the
          “org.openbmc.button.Power” service, I am getting the below
          error.
          <o:p></o:p></p>
        <p class="MsoNormal"><o:p> </o:p></p>
        <p class="MsoNormal">   <b><a
              href="mailto:org.openbmc.buttons.Power@1.service"
              moz-do-not-send="true">org.openbmc.buttons.Power@1.service</a>
            - Phosphor Power Button1<o:p></o:p></b></p>
        <p class="MsoNormal"><b>   Loaded: [[0;1;31merror[[0m (Reason:
            File exists)<o:p></o:p></b></p>
        <p class="MsoNormal"><b>   Active: inactive (dead)<o:p></o:p></b></p>
        <p class="MsoNormal"><b><o:p> </o:p></b></p>
        <p class="MsoNormal"><b>Oct 22 14:14:13 hwmi systemd[1]:
            [[0;1;31m[[0;1;39m[[<a class="moz-txt-link-abbreviated" href="mailto:0;1;31morg.openbmc.buttons.Power@1.service">0;1;31morg.openbmc.buttons.Power@1.service</a>:
            Two services allocated for the same bus name org.open<o:p></o:p></b></p>
        <p class="MsoNormal"><b>bmc.butto.Power, refusing operation.[[0m<o:p></o:p></b></p>
        <p class="MsoNormal"><o:p> </o:p></p>
        <p class="MsoNormal">Please help to figure out and proceed. <o:p></o:p></p>
      </div>
    </blockquote>
    <br>
    <p>Hi Maheswari,</p>
    <p>I'm guessing you already have an
      <a class="moz-txt-link-abbreviated" href="mailto:org.openbmc.buttons.Power@0.service">org.openbmc.buttons.Power@0.service</a> running.</p>
    <p>You can check with:</p>
    <p># systemctl status <a class="moz-txt-link-abbreviated" href="mailto:org.openbmc.buttons.Power@0.service">org.openbmc.buttons.Power@0.service</a> <br>
    </p>
    or just check for the button_power.exe process already running.<br>
    <br>
    <br>
    <blockquote type="cite"
cite="mid:DB7PR02MB43932ACAD795B6BB37676D1192F00@DB7PR02MB4393.eurprd02.prod.outlook.com">
      <div class="WordSection1">
        <p class="MsoNormal"><o:p> </o:p></p>
        <p class="MsoNormal">Thanks <o:p></o:p></p>
        <p class="MsoNormal">Maheswari A <o:p></o:p></p>
        <p class="MsoNormal"><o:p> </o:p></p>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------0BA18F67B02B53959EB07199--
