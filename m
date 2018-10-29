Return-Path: <mspinler@linux.vnet.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=mspinler@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42kPDZ2SknzDrMc
 for <openbmc@lists.ozlabs.org>; Tue, 30 Oct 2018 06:05:01 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w9TIwg3D032379
 for <openbmc@lists.ozlabs.org>; Mon, 29 Oct 2018 15:04:59 -0400
Received: from e31.co.us.ibm.com (e31.co.us.ibm.com [32.97.110.149])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ne5v0601n-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 29 Oct 2018 15:04:58 -0400
Received: from localhost
 by e31.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <mspinler@linux.vnet.ibm.com>;
 Mon, 29 Oct 2018 13:04:57 -0600
Received: from b03cxnp08027.gho.boulder.ibm.com (9.17.130.19)
 by e31.co.us.ibm.com (192.168.1.131) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 29 Oct 2018 13:04:54 -0600
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w9TJ4rJt18808998
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 29 Oct 2018 19:04:53 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BDBC5C605A;
 Mon, 29 Oct 2018 19:04:53 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7FFFAC6057;
 Mon, 29 Oct 2018 19:04:53 +0000 (GMT)
Received: from [9.10.99.83] (unknown [9.10.99.83])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Mon, 29 Oct 2018 19:04:53 +0000 (GMT)
Subject: Re: help: OpenBMC host power on from power button press
To: "A, Maheswari" <maheswari.a@atos.net>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <DB7PR02MB43932ACAD795B6BB37676D1192F00@DB7PR02MB4393.eurprd02.prod.outlook.com>
 <8d187aba-eba1-f68b-17c5-62686e0227a8@linux.vnet.ibm.com>
 <DB7PR02MB4393F07453FADA45F59118FD92F30@DB7PR02MB4393.eurprd02.prod.outlook.com>
From: Matt Spinler <mspinler@linux.vnet.ibm.com>
Date: Mon, 29 Oct 2018 14:04:52 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <DB7PR02MB4393F07453FADA45F59118FD92F30@DB7PR02MB4393.eurprd02.prod.outlook.com>
Content-Type: multipart/alternative;
 boundary="------------76768A312BD449F963AE9200"
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 18102919-8235-0000-0000-00000E1D76F5
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00009949; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000268; SDB=6.01109780; UDB=6.00574983; IPR=6.00889872; 
 MB=3.00023954; MTD=3.00000008; XFM=3.00000015; UTC=2018-10-29 19:04:56
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18102919-8236-0000-0000-0000432BC3EA
Message-Id: <7fe270fc-7a7a-3f54-e85d-d1c006cb10b3@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-10-29_11:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1807170000 definitions=main-1810290172
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
X-List-Received-Date: Mon, 29 Oct 2018 19:05:02 -0000

This is a multi-part message in MIME format.
--------------76768A312BD449F963AE9200
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 10/29/2018 7:05 AM, A, Maheswari wrote:
>
> Hi Matt,
>
> Thanks for your response.
>
> I am able to power on the Host by monitoring GPIO using 
> “phosphor-gpio-monitor” service.
>
> But still we need to achieve same result by 
> org.openbmc.buttons.Power@0.service 
> <mailto:org.openbmc.buttons.Power@0.service> in future.
>
> Here is the response :
>
> # systemctl status org.openbmc.buttons.Power@0.service 
> <mailto:org.openbmc.buttons.Power@0.service>
>
> ● org.openbmc.buttons.Power@0.service - Phosphor Power Button0
>
>    Loaded: loaded 
> (/lib/systemd/system/org.openbmc.buttons.Power@.service; indirect; 
> vendor preset: enabled)
>
>    Active: inactive (dead)
>
> hwmi~# ps | grep button_power.exe
>
> 1205 root      3100 S    grep button_power.exe
>
> hwmi:~#
>
> button_power.exe is not running in BMC.  Service status with instance 
> 0 is not showing any error. But button_power.exe is not running. So 
> that I tried with instance 1.
>

Can you check if this link exists?

/etc/systemd/system/obmc-standby.target.wants/org.openbmc.buttons.Power@0.service

That will start the service on the way to standby.  If it does exist, 
then it should be running, so maybe check
the journal for errors, or try running button_power.exe from the command 
line and see if it crashes.

(can also check that the standby target was reached with systemctl 
status obmc-standby.target)

If it doesn't exist, then you probably don't have 
OBMC_POWER_BUTTON_INSTANCES defined, though
that should be in phosphor-defaults.inc.

> I think below file is responsible for button power controlling in OBMC.
>
> c/skeleton/blob/master/pwrbutton/button_power_obj.c
>
> Here is the receipe file.
>
> Cat ./meta-phosphor/recipes-phosphor/chassis/obmc-button-power.bb
>
> SUMMARY = "OpenBMC org.openbmc.Button example implementation"
>
> DESCRIPTION = "A sample implementation for a button controlling a 
> power domain."
>
> PR = "r1"
>
> inherit skeleton-gdbus
>
> inherit obmc-phosphor-dbus-service
>
> inherit pkgconfig
>
> SKELETON_DIR = "pwrbutton"
>
> FMT = "org.openbmc.buttons.Power@{0}.service"
>
> DBUS_SERVICE_${PN} += "${@compose_list(d, 'FMT', 
> 'OBMC_POWER_BUTTON_INSTANCES')}"
>
> If you need journal log, then I can share it. I need to understand the 
> flow.
>
> Please help to achieve.
>
> Thanks
>
> Maheswari A
>
> *From:*Matt Spinler <mspinler@linux.vnet.ibm.com>
> *Sent:* Saturday, October 27, 2018 1:45 AM
> *To:* A, Maheswari <maheswari.a@atos.net>
> *Cc:* OpenBMC Maillist <openbmc@lists.ozlabs.org>
> *Subject:* Re: help: OpenBMC host power on from power button press
>
> On 10/25/2018 11:52 PM, A, Maheswari wrote:
>
>     Hi,
>
>     I am new to openBMC project.
>
>     We are in the process of porting power button gpio interrupt
>     handling in openBMC.
>
>     After some a lot of analysis, I found that obmc-button-power
>     related service are necessary to power on the host using power
>     button press event.
>
>     I have added POWER_BUTTON and machine specific GPIO number and
>     polarity in gpio_defs.json.
>
>     While starting the “org.openbmc.button.Power” service, I am
>     getting the below error.
>
>     *org.openbmc.buttons.Power@1.service
>     <mailto:org.openbmc.buttons.Power@1.service> - Phosphor Power Button1*
>
>     *   Loaded: [[0;1;31merror[[0m (Reason: File exists)*
>
>     *   Active: inactive (dead)*
>
>     **
>
>     *Oct 22 14:14:13 hwmi systemd[1]:
>     [[0;1;31m[[0;1;39m[[0;1;31morg.openbmc.buttons.Power@1.service
>     <mailto:0;1;31morg.openbmc.buttons.Power@1.service>: Two services
>     allocated for the same bus name org.open*
>
>     *bmc.butto.Power, refusing operation.[[0m*
>
>     Please help to figure out and proceed.
>
> Hi Maheswari,
>
> I'm guessing you already have an org.openbmc.buttons.Power@0.service 
> <mailto:org.openbmc.buttons.Power@0.service> running.
>
> You can check with:
>
> # systemctl status org.openbmc.buttons.Power@0.service 
> <mailto:org.openbmc.buttons.Power@0.service>
>
> or just check for the button_power.exe process already running.
>
>
>
>     Thanks
>
>     Maheswari A
>


--------------76768A312BD449F963AE9200
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p><br>
    </p>
    <br>
    <div class="moz-cite-prefix">On 10/29/2018 7:05 AM, A, Maheswari
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:DB7PR02MB4393F07453FADA45F59118FD92F30@DB7PR02MB4393.eurprd02.prod.outlook.com">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
	color:black;
	mso-fareast-language:EN-US;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
p.msonormal0, li.msonormal0, div.msonormal0
	{mso-style-name:msonormal;
	mso-margin-top-alt:auto;
	margin-right:0cm;
	mso-margin-bottom-alt:auto;
	margin-left:0cm;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	color:black;}
span.EmailStyle18
	{mso-style-type:personal;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
span.EmailStyle20
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
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
        <p class="MsoNormal"><span style="color:windowtext"><o:p> </o:p></span></p>
        <p class="MsoNormal"><span style="color:windowtext">Hi Matt, <o:p></o:p></span></p>
        <p class="MsoNormal"><span style="color:windowtext"><o:p> </o:p></span></p>
        <p class="MsoNormal"><span style="color:windowtext">Thanks for
            your response.<o:p></o:p></span></p>
        <p class="MsoNormal"><span style="color:windowtext"><o:p> </o:p></span></p>
        <p class="MsoNormal"><span style="color:windowtext">I am able to
            power on the Host by monitoring GPIO using
            “phosphor-gpio-monitor” service.
            <o:p></o:p></span></p>
        <p><span style="color:windowtext">But still we need to achieve
            same result by </span>
          <a href="mailto:org.openbmc.buttons.Power@0.service"
            moz-do-not-send="true">org.openbmc.buttons.Power@0.service</a>
          in future.
          <o:p></o:p></p>
        <p><span style="color:windowtext">Here is the response :</span><o:p></o:p></p>
        <p><span style="color:windowtext"></span># systemctl status <a
            href="mailto:org.openbmc.buttons.Power@0.service"
            moz-do-not-send="true">
            org.openbmc.buttons.Power@0.service</a><span
            style="color:windowtext"><o:p></o:p></span></p>
        <p class="MsoNormal"><span style="color:windowtext">●
            <a class="moz-txt-link-abbreviated" href="mailto:org.openbmc.buttons.Power@0.service">org.openbmc.buttons.Power@0.service</a> - Phosphor Power Button0<o:p></o:p></span></p>
        <p class="MsoNormal"><span style="color:windowtext">   Loaded:
            loaded
            (/lib/systemd/system/org.openbmc.buttons.Power@.service;
            indirect; vendor preset: enabled)<o:p></o:p></span></p>
        <p class="MsoNormal"><span style="color:windowtext">   Active:
            inactive (dead)<o:p></o:p></span></p>
        <p class="MsoNormal"><span style="color:windowtext"><o:p> </o:p></span></p>
        <p class="MsoNormal"><span style="color:windowtext">hwmi~# ps |
            grep button_power.exe<o:p></o:p></span></p>
        <p class="MsoNormal"><span style="color:windowtext">1205
            root      3100 S    grep button_power.exe<o:p></o:p></span></p>
        <p class="MsoNormal"><span style="color:windowtext">hwmi:~#<o:p></o:p></span></p>
        <p class="MsoNormal"><span style="color:windowtext"><o:p> </o:p></span></p>
        <p class="MsoNormal"><span style="color:windowtext">button_power.exe
            is not running in BMC.  Service status with instance 0 is
            not showing any error. But button_power.exe is not running.
            So that I tried with instance 1.
          </span></p>
      </div>
    </blockquote>
    <br>
    Can you check if this link exists?<br>
    <br>
/etc/systemd/system/obmc-standby.target.wants/org.openbmc.buttons.Power@0.service<br>
    <br>
    That will start the service on the way to standby.  If it does
    exist, then it should be running, so maybe check<br>
    the journal for errors, or try running button_power.exe from the
    command line and see if it crashes.<br>
    <br>
    (can also check that the standby target was reached with systemctl
    status obmc-standby.target)<br>
    <br>
    If it doesn't exist, then you probably don't have <span
      style="color:windowtext">OBMC_POWER_BUTTON_INSTANCES defined,
      though<br>
      that should be in phosphor-defaults.inc. <br>
    </span><br>
    <blockquote type="cite"
cite="mid:DB7PR02MB4393F07453FADA45F59118FD92F30@DB7PR02MB4393.eurprd02.prod.outlook.com">
      <div class="WordSection1">
        <p class="MsoNormal"><span style="color:windowtext"><o:p></o:p></span></p>
        <p class="MsoNormal"><span style="color:windowtext"><o:p> </o:p></span></p>
        <p class="MsoNormal"><span style="color:windowtext">I think
            below file is responsible for button power controlling in
            OBMC.
            <o:p></o:p></span></p>
        <p class="MsoNormal"><span style="color:windowtext">c/skeleton/blob/master/pwrbutton/button_power_obj.c
            <o:p></o:p></span></p>
        <p class="MsoNormal"><span style="color:windowtext"><o:p> </o:p></span></p>
        <p class="MsoNormal"><span style="color:windowtext">Here is the
            receipe file. <o:p>
            </o:p></span></p>
        <p class="MsoNormal"><span style="color:windowtext"><o:p> </o:p></span></p>
        <p class="MsoNormal"><span style="color:windowtext">Cat
            ./meta-phosphor/recipes-phosphor/chassis/obmc-button-power.bb<o:p></o:p></span></p>
        <p class="MsoNormal"><span style="color:windowtext">SUMMARY =
            "OpenBMC org.openbmc.Button example implementation"<o:p></o:p></span></p>
        <p class="MsoNormal"><span style="color:windowtext">DESCRIPTION
            = "A sample implementation for a button controlling a power
            domain."<o:p></o:p></span></p>
        <p class="MsoNormal"><span style="color:windowtext">PR = "r1"<o:p></o:p></span></p>
        <p class="MsoNormal"><span style="color:windowtext"><o:p> </o:p></span></p>
        <p class="MsoNormal"><span style="color:windowtext">inherit
            skeleton-gdbus<o:p></o:p></span></p>
        <p class="MsoNormal"><span style="color:windowtext">inherit
            obmc-phosphor-dbus-service<o:p></o:p></span></p>
        <p class="MsoNormal"><span style="color:windowtext">inherit
            pkgconfig<o:p></o:p></span></p>
        <p class="MsoNormal"><span style="color:windowtext"><o:p> </o:p></span></p>
        <p class="MsoNormal"><span style="color:windowtext">SKELETON_DIR
            = "pwrbutton"<o:p></o:p></span></p>
        <p class="MsoNormal"><span style="color:windowtext"><o:p> </o:p></span></p>
        <p class="MsoNormal"><span style="color:windowtext" lang="DE">FMT
            = <a class="moz-txt-link-rfc2396E" href="mailto:org.openbmc.buttons.Power@{0}.service">"org.openbmc.buttons.Power@{0}.service"</a><o:p></o:p></span></p>
        <p class="MsoNormal"><span style="color:windowtext">DBUS_SERVICE_${PN}
            += "${@compose_list(d, 'FMT',
            'OBMC_POWER_BUTTON_INSTANCES')}"<o:p></o:p></span></p>
        <p class="MsoNormal"><span style="color:windowtext"><o:p> </o:p></span></p>
        <p class="MsoNormal"><span style="color:windowtext">If you need
            journal log, then I can share it. I need to understand the
            flow.
            <o:p></o:p></span></p>
        <p class="MsoNormal"><span style="color:windowtext"><o:p> </o:p></span></p>
        <p class="MsoNormal"><span style="color:windowtext">Please help
            to achieve. <o:p>
            </o:p></span></p>
        <p class="MsoNormal"><span style="color:windowtext"><o:p> </o:p></span></p>
        <p class="MsoNormal"><span style="color:windowtext">Thanks <o:p></o:p></span></p>
        <p class="MsoNormal"><span style="color:windowtext">Maheswari A<o:p></o:p></span></p>
        <div>
          <div style="border:none;border-top:solid #E1E1E1
            1.0pt;padding:3.0pt 0cm 0cm 0cm">
            <p class="MsoNormal"><b><span
                  style="color:windowtext;mso-fareast-language:EN-IN"
                  lang="EN-US">From:</span></b><span
                style="color:windowtext;mso-fareast-language:EN-IN"
                lang="EN-US"> Matt Spinler
                <a class="moz-txt-link-rfc2396E" href="mailto:mspinler@linux.vnet.ibm.com">&lt;mspinler@linux.vnet.ibm.com&gt;</a>
                <br>
                <b>Sent:</b> Saturday, October 27, 2018 1:45 AM<br>
                <b>To:</b> A, Maheswari <a class="moz-txt-link-rfc2396E" href="mailto:maheswari.a@atos.net">&lt;maheswari.a@atos.net&gt;</a><br>
                <b>Cc:</b> OpenBMC Maillist
                <a class="moz-txt-link-rfc2396E" href="mailto:openbmc@lists.ozlabs.org">&lt;openbmc@lists.ozlabs.org&gt;</a><br>
                <b>Subject:</b> Re: help: OpenBMC host power on from
                power button press<o:p></o:p></span></p>
          </div>
        </div>
        <p class="MsoNormal"><o:p> </o:p></p>
        <p class="MsoNormal"><span style="mso-fareast-language:EN-IN"><o:p> </o:p></span></p>
        <div>
          <p class="MsoNormal">On 10/25/2018 11:52 PM, A, Maheswari
            wrote:<o:p></o:p></p>
        </div>
        <blockquote style="margin-top:5.0pt;margin-bottom:5.0pt">
          <p class="MsoNormal">Hi, <o:p></o:p></p>
          <p class="MsoNormal"> <o:p></o:p></p>
          <p class="MsoNormal">I am new to openBMC project. <o:p></o:p></p>
          <p class="MsoNormal"> <o:p></o:p></p>
          <p class="MsoNormal">We are in the process of porting power
            button gpio interrupt handling in openBMC.
            <o:p></o:p></p>
          <p class="MsoNormal"> <o:p></o:p></p>
          <p class="MsoNormal">After some a lot of analysis, I found
            that obmc-button-power related service are necessary to
            power on the host using power button press event.
            <o:p></o:p></p>
          <p class="MsoNormal"> <o:p></o:p></p>
          <p class="MsoNormal">I have added POWER_BUTTON and machine
            specific GPIO number and polarity in gpio_defs.json.
            <o:p></o:p></p>
          <p class="MsoNormal"> <o:p></o:p></p>
          <p class="MsoNormal">While starting the
            “org.openbmc.button.Power” service, I am getting the below
            error.
            <o:p></o:p></p>
          <p class="MsoNormal"> <o:p></o:p></p>
          <p class="MsoNormal">   <b><a
                href="mailto:org.openbmc.buttons.Power@1.service"
                moz-do-not-send="true">org.openbmc.buttons.Power@1.service</a>
              - Phosphor Power Button1</b><o:p></o:p></p>
          <p class="MsoNormal"><b>   Loaded: [[0;1;31merror[[0m (Reason:
              File exists)</b><o:p></o:p></p>
          <p class="MsoNormal"><b>   Active: inactive (dead)</b><o:p></o:p></p>
          <p class="MsoNormal"><b> </b><o:p></o:p></p>
          <p class="MsoNormal"><b>Oct 22 14:14:13 hwmi systemd[1]:
              [[0;1;31m[[0;1;39m[[<a
                href="mailto:0;1;31morg.openbmc.buttons.Power@1.service"
                moz-do-not-send="true">0;1;31morg.openbmc.buttons.Power@1.service</a>:
              Two services allocated for the same bus name org.open</b><o:p></o:p></p>
          <p class="MsoNormal"><b>bmc.butto.Power, refusing
              operation.[[0m</b><o:p></o:p></p>
          <p class="MsoNormal"> <o:p></o:p></p>
          <p class="MsoNormal">Please help to figure out and proceed. <o:p></o:p></p>
        </blockquote>
        <p class="MsoNormal"><span style="mso-fareast-language:EN-IN"><o:p> </o:p></span></p>
        <p>Hi Maheswari,<o:p></o:p></p>
        <p>I'm guessing you already have an <a
            href="mailto:org.openbmc.buttons.Power@0.service"
            moz-do-not-send="true">
            org.openbmc.buttons.Power@0.service</a> running.<o:p></o:p></p>
        <p>You can check with:<o:p></o:p></p>
        <p># systemctl status <a
            href="mailto:org.openbmc.buttons.Power@0.service"
            moz-do-not-send="true">org.openbmc.buttons.Power@0.service</a>
          <o:p></o:p></p>
        <p class="MsoNormal"><span style="mso-fareast-language:EN-IN">or
            just check for the button_power.exe process already running.<br>
            <br>
            <br>
            <br>
            <o:p></o:p></span></p>
        <blockquote style="margin-top:5.0pt;margin-bottom:5.0pt">
          <p class="MsoNormal"> <o:p></o:p></p>
          <p class="MsoNormal">Thanks <o:p></o:p></p>
          <p class="MsoNormal">Maheswari A <o:p></o:p></p>
          <p class="MsoNormal"> <o:p></o:p></p>
        </blockquote>
        <p class="MsoNormal"><span style="mso-fareast-language:EN-IN"><o:p> </o:p></span></p>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------76768A312BD449F963AE9200--
