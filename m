Return-Path: <miltonm@us.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rpJSP4My7zDqpR
 for <openbmc@lists.ozlabs.org>; Tue, 12 Jul 2016 07:41:08 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.11/8.16.0.11) with SMTP id
 u6BLaHUH084132
 for <openbmc@lists.ozlabs.org>; Mon, 11 Jul 2016 17:41:05 -0400
Received: from e33.co.us.ibm.com (e33.co.us.ibm.com [32.97.110.151])
 by mx0b-001b2d01.pphosted.com with ESMTP id 243ens26tu-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 11 Jul 2016 17:41:05 -0400
Received: from localhost
 by e33.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <miltonm@us.ibm.com>;
 Mon, 11 Jul 2016 15:41:04 -0600
Received: from d03dlp03.boulder.ibm.com (9.17.202.179)
 by e33.co.us.ibm.com (192.168.1.133) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Mon, 11 Jul 2016 15:41:02 -0600
X-IBM-Helo: d03dlp03.boulder.ibm.com
X-IBM-MailFrom: miltonm@us.ibm.com
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29])
 by d03dlp03.boulder.ibm.com (Postfix) with ESMTP id 006F519D8047
 for <openbmc@lists.ozlabs.org>; Mon, 11 Jul 2016 15:40:38 -0600 (MDT)
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u6BLf4vB12517782
 for <openbmc@lists.ozlabs.org>; Mon, 11 Jul 2016 21:41:04 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EABDD124047
 for <openbmc@lists.ozlabs.org>; Mon, 11 Jul 2016 17:41:01 -0400 (EDT)
Received: from d50lp01.ny.us.ibm.com (unknown [146.89.104.207])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTPS id D5AC012403F
 for <openbmc@lists.ozlabs.org>; Mon, 11 Jul 2016 17:41:01 -0400 (EDT)
Received: from localhost
 by d50lp01.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <miltonm@us.ibm.com>;
 Mon, 11 Jul 2016 17:41:01 -0400
Received: from smtp.notes.na.collabserv.com (192.155.248.66)
 by d50lp01.ny.us.ibm.com (158.87.18.20) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256/256)
 Mon, 11 Jul 2016 17:40:59 -0400
X-IBM-Helo: smtp.notes.na.collabserv.com
X-IBM-MailFrom: miltonm@us.ibm.com
Received: from /spool/local
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <miltonm@us.ibm.com>;
 Mon, 11 Jul 2016 21:40:58 -0000
Received: from us1a3-smtp02.a3.dal06.isc4sb.com (10.106.154.159)
 by smtp.notes.na.collabserv.com (10.106.227.127) with
 smtp.notes.na.collabserv.com ESMTP; Mon, 11 Jul 2016 21:40:56 -0000
Received: from us1a3-mail79.a3.dal09.isc4sb.com ([10.142.3.136])
 by us1a3-smtp02.a3.dal06.isc4sb.com
 with ESMTP id 2016071121405627-551915 ;
 Mon, 11 Jul 2016 21:40:56 +0000 
In-Reply-To: <20160711213013.11995-2-openbmc-patches@stwcx.xyz>
Subject: Re: [PATCH docs 1/2] Clean up formatting
From: "Milton Miller II" <miltonm@us.ibm.com>
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>
Cc: openbmc@lists.ozlabs.org
Date: Mon, 11 Jul 2016 21:40:56 +0000
MIME-Version: 1.0
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: <20160711213013.11995-2-openbmc-patches@stwcx.xyz>,
 <20160711213013.11995-1-openbmc-patches@stwcx.xyz>
X-Mailer: IBM Domino Build V851SAAS_06272016_FP2.2 July 08, 2016
X-LLNOutbound: False
X-Disclaimed: 30043
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
x-cbid: 16071121-0008-0000-0000-00000507BFA8
X-IBM-ISS-SpamDetectors: Score=0.40962; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.40962; ST=0; TS=0; UL=0; ISC=
X-IBM-ISS-DetailInfo: BY=3.00005484; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000173; SDB=6.00728998; UDB=6.00341397; UTC=2016-07-11
 21:40:57
x-cbparentid: 16071121-9588-0000-0000-000004A2E6D3
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
X-TM-AS-GCONF: 00
X-Content-Scanned: Fidelis XPS MAILER
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
Message-Id: <OF71A595F3.C22D3420-ON00257FED.00771AA5-00257FED.00771AA8@notes.na.collabserv.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2016-07-11_14:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1604210000
 definitions=main-1607110213
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 11 Jul 2016 21:41:10 -0000

Replying to my own patch with some minor changelog deficiencies

>
>When reviewing the formatted output I discovered my receint additions

recent=20

>to the dbus interfaces did not have trailing periods.  In addition
>one of the entries did not parse the bold formatting.  I tracked
>the later down to a space between the text and the intended end bold.
>
>I also added a few columns to headers where the text was longer than
>the initial columns.  This makes the file a bit easier to read when
>viewing the markdown as plain text.
>
>Signed-off-by: Milton Miller <miltonm@us.ibm.com>
>---
> dbus-interfaces.md | 22 +++++++++++-----------
> 1 file changed, 11 insertions(+), 11 deletions(-)

>-| `Apply`             | `void`       | `void`        | **Initiate
>writing image into flash**|

I also changed the preposition, now 'write to' vs 'write into' ....

>-| `GetUpdateProgress` | `void`       | `s`           | **Display
>progress log `Apply` phase**|
>-|                     |              | `s`           | The `state`
>and log output from `Apply` |
>+| `PrepareForUpdate`  | `void`       | `void`        | **Reboot BMC
>with Flash content cached in RAM.**|
>+| `Abort`             | `void`       | `void`        | **Abort any
>pending, broken, or in-progress flash update.**|
>+| `Apply`             | `void`       | `void`        | **Initiate
>writing image to flash.**|
>+| `GetUpdateProgress` | `void`       | `s`           | **Display
>progress log `Apply` phase.**|
>+|                     |              | `s`           | The `status`
>and log output from `Apply`|

... and corrected the property name from 'state' to 'status'.

Let me know if I need to resend.

milton
