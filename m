Return-Path: <vishwa@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xNSRN0yr6zDqjD
 for <openbmc@lists.ozlabs.org>; Thu,  3 Aug 2017 21:25:51 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v73BNevp051366
 for <openbmc@lists.ozlabs.org>; Thu, 3 Aug 2017 07:25:48 -0400
Received: from e23smtp01.au.ibm.com (e23smtp01.au.ibm.com [202.81.31.143])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2c40eu6r01-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 03 Aug 2017 07:25:46 -0400
Received: from localhost
 by e23smtp01.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <vishwa@linux.vnet.ibm.com>;
 Thu, 3 Aug 2017 21:25:44 +1000
Received: from d23relay08.au.ibm.com (202.81.31.227)
 by e23smtp01.au.ibm.com (202.81.31.207) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Thu, 3 Aug 2017 21:25:29 +1000
Received: from d23av03.au.ibm.com (d23av03.au.ibm.com [9.190.234.97])
 by d23relay08.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v73BPSCa26017870
 for <openbmc@lists.ozlabs.org>; Thu, 3 Aug 2017 21:25:28 +1000
Received: from d23av03.au.ibm.com (localhost [127.0.0.1])
 by d23av03.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 v73BPJb3025891
 for <openbmc@lists.ozlabs.org>; Thu, 3 Aug 2017 21:25:19 +1000
Received: from [9.77.196.55] ([9.77.196.55])
 by d23av03.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 v73BPHEV025871
 for <openbmc@lists.ozlabs.org>; Thu, 3 Aug 2017 21:25:18 +1000
From: vishwa <vishwa@linux.vnet.ibm.com>
Subject: Design proposal on removing /org/openbmc/settings/boot_policy"
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Date: Thu, 3 Aug 2017 16:55:21 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.0
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary="------------63FC02D03F57ECC9B5D92F2F"
X-TM-AS-MML: disable
x-cbid: 17080311-1617-0000-0000-000001F9B341
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17080311-1618-0000-0000-00004843C0E2
Message-Id: <b820c5bf-3f9c-b59d-97d1-549df44aa1e5@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-08-03_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1706020000
 definitions=main-1708030174
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
X-List-Received-Date: Thu, 03 Aug 2017 11:25:52 -0000

This is a multi-part message in MIME format.
--------------63FC02D03F57ECC9B5D92F2F
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

This email is about the IPMI chassis command: Get-Boot-Options and 
Set-Boot-Options.

IPMI boot_flags could have one of these ["Network", "Disk", "Safe", 
"CDROM", "Setup", "Default"]

Original Settings implementation had any of the above values settable 
via "/org/openbmc/settings/host0:boot_flags"

There was another setting called "boot_policy" exported via 
"/org/openbmc/settings/host0:boot_policy" and the valid values were
[ONETIME, PERMANENT].

User would update "boot_flag" and "boot_policy" with the values and 
BMC-IPMID would supply these values when asked by Petitboot via 
Get-Boot-Options.

Petit boot would consume these and then if a setting was [ONETIME], then 
it would write boot_flag to [Default] via Set-Boot-Options IPMI command 
and IPMID would update /org/openbmc/settings/host0:boot_flags.

*Jeremy*, please help confirm.

As part of Settings refactoring, `boot_flags` was divided into 2 parts, 
still using "/org/openbmc/settings/host0:boot_policy"

*/xyz/openbmc_project/Control/Boot/Mode* : Catering to "Safe", "Setup" 
and "Regular", Where Regular meaning : 0

*/xyz/openbmc_project/Control/Boot/Source* : Catering to "Network", 
"Disk", "ExternalMedia". "Default", Where Default meaning : 0

Since IPMI could take any single value from either Mode or Source, IPMID 
code looked at Source first and if set, it used it and if not, it 
checked Mode and used if set. If none was set, it returned default as it 
used to do before.

Similiarly, as part of Set-Boot-Options, IPMID processed Source and then 
Mode and updated respective dbus objects.

Now, the proposal is to remove 
'"/org/openbmc/settings/host0:boot_policy"' and then put this as a 
boolean into 'persist' property into:

/xyz/openbmc_project/Control/Boot/Mode and 
/xyz/openbmc_project/Control/Boot/Source.

IPMID would then look at this new boolean to see if its ONETIME ( 
boolean : 0 ) or PERMANENT ( boolean : 1 ) and respond to Get-Boot-Options.

Similarly, for Set-Boot-Options, it would update 'persist' property 
depending on what is sent by Petit boot.

As part of persistency, Settings would save the data that gets written 
to /xyz/openbmc_project/Control/Boot/Mode and 
/xyz/openbmc_project/Control/Boot/Source D-Bus object.

Please provide your feedback on this.

Thank you.

!! Vishwa !!


--------------63FC02D03F57ECC9B5D92F2F
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=utf-8">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <p>This email is about the IPMI chassis command: Get-Boot-Options
      and Set-Boot-Options.<br>
      <br>
      IPMI boot_flags could have one of these ["Network", "Disk",
      "Safe", "CDROM", "Setup", "Default"]<br>
      <br>
      Original Settings implementation had any of the above values
      settable via "/org/openbmc/settings/host0:boot_flags"<br>
      <br>
      There was another setting called "boot_policy" exported via
      "/org/openbmc/settings/host0:boot_policy" and the valid values
      were <br>
      [ONETIME, PERMANENT].<br>
      <br>
      User would update "boot_flag" and "boot_policy" with the values
      and BMC-IPMID would supply these values when asked by Petitboot
      via Get-Boot-Options.<br>
      <br>
      Petit boot would consume these and then if a setting was
      [ONETIME], then it would write boot_flag to [Default] via
      Set-Boot-Options IPMI command and IPMID would update
      /org/openbmc/settings/host0:boot_flags.<br>
      <br>
      <b>Jeremy</b>, please help confirm.<br>
      <br>
      As part of Settings refactoring, `boot_flags` was divided into 2
      parts, still using "/org/openbmc/settings/host0:boot_policy" <br>
      <br>
      */xyz/openbmc_project/Control/Boot/Mode* : Catering to "Safe",
      "Setup" and "Regular", Where Regular meaning : 0<br>
      <br>
      */xyz/openbmc_project/Control/Boot/Source* : Catering to
      "Network", "Disk", "ExternalMedia". "Default", Where Default
      meaning : 0<br>
      <br>
      Since IPMI could take any single value from either Mode or Source,
      IPMID code looked at Source first and if set, it used it and if
      not, it checked Mode and used if set. If none was set, it returned
      default as it used to do before.<br>
      <br>
      Similiarly, as part of Set-Boot-Options, IPMID processed Source
      and then Mode and updated respective dbus objects.<br>
      <br>
      Now, the proposal is to remove
      '"/org/openbmc/settings/host0:boot_policy"' and then put this as a
      boolean into 'persist' property into:<br>
      <br>
      /xyz/openbmc_project/Control/Boot/Mode and
      /xyz/openbmc_project/Control/Boot/Source.<br>
      <br>
      IPMID would then look at this new boolean to see if its ONETIME (
      boolean : 0 ) or PERMANENT ( boolean : 1 ) and respond to
      Get-Boot-Options.<br>
      <br>
      Similarly, for Set-Boot-Options, it would update 'persist'
      property depending on what is sent by Petit boot.<br>
      <br>
      As part of persistency, Settings would save the data that gets
      written to /xyz/openbmc_project/Control/Boot/Mode and
      /xyz/openbmc_project/Control/Boot/Source D-Bus object.<br>
      <br>
      Please provide your feedback on this.<br>
      <br>
      Thank you.<br>
      <br>
      !! Vishwa !!<br>
    </p>
  </body>
</html>

--------------63FC02D03F57ECC9B5D92F2F--
