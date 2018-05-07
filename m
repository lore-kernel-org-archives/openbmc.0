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
 by lists.ozlabs.org (Postfix) with ESMTPS id 40fdJs422dzF1Nq
 for <openbmc@lists.ozlabs.org>; Mon,  7 May 2018 19:55:05 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w479mkeV042255
 for <openbmc@lists.ozlabs.org>; Mon, 7 May 2018 05:55:01 -0400
Received: from e06smtp12.uk.ibm.com (e06smtp12.uk.ibm.com [195.75.94.108])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2htm3fh6n2-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 07 May 2018 05:55:01 -0400
Received: from localhost
 by e06smtp12.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <tomjose@linux.vnet.ibm.com>;
 Mon, 7 May 2018 10:54:59 +0100
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp12.uk.ibm.com (192.168.101.142) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Mon, 7 May 2018 10:54:57 +0100
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w479sv8B66977952; Mon, 7 May 2018 09:54:57 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 10C03AE053;
 Mon,  7 May 2018 10:44:27 +0100 (BST)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E4B67AE045;
 Mon,  7 May 2018 10:44:25 +0100 (BST)
Received: from [9.193.103.147] (unknown [9.193.103.147])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Mon,  7 May 2018 10:44:25 +0100 (BST)
Subject: Re: How the Set boot mode and Set boot source works ?
To: Brad Chou <chou.brad@gmail.com>, openbmc@lists.ozlabs.org
References: <4B72FB83-4B7F-4704-BE55-555B14FFC801@gmail.com>
From: Tom Joseph <tomjose@linux.vnet.ibm.com>
Date: Mon, 7 May 2018 15:24:54 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <4B72FB83-4B7F-4704-BE55-555B14FFC801@gmail.com>
Content-Type: multipart/alternative;
 boundary="------------DE90DE055ED15761CCF2FA14"
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 18050709-0008-0000-0000-000004F3DF14
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18050709-0009-0000-0000-00001E88186E
Message-Id: <fe47b2a0-34e1-6fd3-9afc-e37a5b321d73@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-05-07_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1805070102
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
X-List-Received-Date: Mon, 07 May 2018 09:55:10 -0000

This is a multi-part message in MIME format.
--------------DE90DE055ED15761CCF2FA14
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello Brad,

These boot options correspond to the boot flags in the Get/Set system 
boot options command.
The get/set system boot options command can be used to configure boot 
mode/boot source.
On OpenPower systems, Petitboot sends IPMI commands to get/set these 
parameters.

Refer this to understand how the IPMI command is mapped to the D-Bus 
property.

https://github.com/openbmc/phosphor-host-ipmid/blob/master/chassishandler.cpp#L1181
https://github.com/openbmc/phosphor-host-ipmid/blob/master/chassishandler.cpp#L1320

Regards,
Tom

On Monday 07 May 2018 03:09 PM, Brad Chou wrote:
> Hi everyone,
> I have read the 
> https://github.com/openbmc/docs/blob/master/REST-cheatsheet.md
> And follow it to *Set boot mode* and *Set boot source*.
> My CPU is Intel x86 based, so I don’t expected it will work with those 
> two commands.
> So I just want to know how those two commands work with openpower system.
> Does the CPU send some commands to BMC to get these settings when 
> power up ?
> What kind of command formate ?
> If I want to make my x86 CPU to work with it, what should I going to 
> do first ?
>
> Thanks.


--------------DE90DE055ED15761CCF2FA14
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>Hello Brad,</p>
    These boot options correspond to the boot flags in the Get/Set
    system boot options command.<br>
    The get/set system boot options command can be used to configure
    boot mode/boot source.<br>
    On OpenPower systems, Petitboot sends IPMI commands to get/set these
    parameters.<br>
    <br>
    Refer this to understand how the IPMI command is mapped to the D-Bus
    property.<br>
    <br>
<a class="moz-txt-link-freetext" href="https://github.com/openbmc/phosphor-host-ipmid/blob/master/chassishandler.cpp#L1181">https://github.com/openbmc/phosphor-host-ipmid/blob/master/chassishandler.cpp#L1181</a><br>
<a class="moz-txt-link-freetext" href="https://github.com/openbmc/phosphor-host-ipmid/blob/master/chassishandler.cpp#L1320">https://github.com/openbmc/phosphor-host-ipmid/blob/master/chassishandler.cpp#L1320</a><br>
    <br>
    Regards,<br>
    Tom<br>
    <br>
    <div class="moz-cite-prefix">On Monday 07 May 2018 03:09 PM, Brad
      Chou wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:4B72FB83-4B7F-4704-BE55-555B14FFC801@gmail.com">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <div class="">Hi everyone,</div>
      I have read the <a
        href="https://github.com/openbmc/docs/blob/master/REST-cheatsheet.md"
        class="" moz-do-not-send="true">https://github.com/openbmc/docs/blob/master/REST-cheatsheet.md</a>
      <div class="">And follow it to <b class="">Set boot mode</b> and <b
          class="">Set boot source</b>.</div>
      <div class="">My CPU is Intel x86 based, so I don’t expected it
        will work with those two commands.</div>
      <div class="">So I just want to know how those two commands work
        with openpower system.</div>
      <div class="">Does the CPU send some commands to BMC to get these
        settings when power up ?</div>
      <div class="">What kind of command formate ?</div>
      <div class="">If I want to make my x86 CPU to work with it, what
        should I going to do first ?</div>
      <div class=""><br class="">
      </div>
      <div class="">Thanks.</div>
    </blockquote>
    <br>
  </body>
</html>

--------------DE90DE055ED15761CCF2FA14--
