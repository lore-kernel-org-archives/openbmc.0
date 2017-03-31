Return-Path: <miltonm@us.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vvqzs6jPZzDqH8
 for <openbmc@lists.ozlabs.org>; Sat,  1 Apr 2017 05:39:53 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v2VIaQA1028171
 for <openbmc@lists.ozlabs.org>; Fri, 31 Mar 2017 14:39:45 -0400
Received: from e19.ny.us.ibm.com (e19.ny.us.ibm.com [129.33.205.209])
 by mx0a-001b2d01.pphosted.com with ESMTP id 29hvhng30e-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 31 Mar 2017 14:39:44 -0400
Received: from localhost
 by e19.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <miltonm@us.ibm.com>;
 Fri, 31 Mar 2017 14:39:43 -0400
Received: from b01cxnp22034.gho.pok.ibm.com (9.57.198.24)
 by e19.ny.us.ibm.com (146.89.104.206) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Fri, 31 Mar 2017 14:39:41 -0400
Received: from b01ledav03.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v2VIdebe44499170
 for <openbmc@lists.ozlabs.org>; Fri, 31 Mar 2017 18:39:40 GMT
Received: from b01ledav03.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 38DD5B2054
 for <openbmc@lists.ozlabs.org>; Fri, 31 Mar 2017 14:39:36 -0400 (EDT)
Received: from d50lp03.ny.us.ibm.com (unknown [146.89.104.211])
 by b01ledav03.gho.pok.ibm.com (Postfix) with ESMTPS id 243AEB204D
 for <openbmc@lists.ozlabs.org>; Fri, 31 Mar 2017 14:39:36 -0400 (EDT)
Received: from localhost
 by d50lp03.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <miltonm@us.ibm.com>;
 Fri, 31 Mar 2017 14:39:40 -0400
Received: from smtp.notes.na.collabserv.com (192.155.248.67)
 by d50lp03.ny.us.ibm.com (158.87.18.22) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128/128)
 Fri, 31 Mar 2017 14:39:37 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <miltonm@us.ibm.com>;
 Fri, 31 Mar 2017 18:39:36 -0000
Received: from us1a3-smtp08.a3.dal06.isc4sb.com (10.146.103.57)
 by smtp.notes.na.collabserv.com (10.106.227.16) with
 smtp.notes.na.collabserv.com ESMTP; Fri, 31 Mar 2017 18:39:34 -0000
Received: from us1a3-mail79.a3.dal09.isc4sb.com ([10.142.3.136])
 by us1a3-smtp08.a3.dal06.isc4sb.com
 with ESMTP id 2017033118393369-360159 ;
 Fri, 31 Mar 2017 18:39:33 +0000 
In-Reply-To: <CAFR_W8or0O0BADTKkF9=PA1GMHQx-_a2GkqLB5+F3nMKHaM4_g@mail.gmail.com>
Subject: Re: iface is not coming back up fully after ifdown
From: "Milton Miller II" <miltonm@us.ibm.com>
To: Maxim Sloyko <maxims@google.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Date: Fri, 31 Mar 2017 18:39:33 +0000
MIME-Version: 1.0
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: <CAFR_W8or0O0BADTKkF9=PA1GMHQx-_a2GkqLB5+F3nMKHaM4_g@mail.gmail.com>
X-Mailer: IBM iNotes ($HaikuForm 927.1) | IBM Domino Build
 SCN_20170321T1353_FP5 March 28, 2017 at 09:53
X-LLNOutbound: False
X-Disclaimed: 9363
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
x-cbid: 17033118-0056-0000-0000-00000327CA16
X-IBM-SpamModules-Scores: BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.40962; ST=0; TS=0; UL=0; ISC=; MB=0.185646
X-IBM-SpamModules-Versions: BY=3.00006875; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000207; SDB=6.00841312; UDB=6.00414220; IPR=6.00619377; 
 BA=6.00005249; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00014874; XFM=3.00000013;
 UTC=2017-03-31 18:39:35
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2017-03-31 18:02:00 - 6.00006528
x-cbparentid: 17033118-0328-0000-0000-00000370A5EB
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
X-TM-AS-GCONF: 00
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00006875; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000207; SDB=6.00841312; UDB=6.00414221; IPR=6.00619377; 
 BA=6.00005249; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00014874; XFM=3.00000013;
 UTC=2017-03-31 18:39:42
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
Message-Id: <OF3061F1E4.F0B01FFC-ON002580F4.00667FD2-002580F4.00667FD7@notes.na.collabserv.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-03-31_15:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1702020001
 definitions=main-1703310171
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
X-List-Received-Date: Fri, 31 Mar 2017 18:39:54 -0000

On  03/31/2017 around 12:25PM in some timezone, Maxim Sloyko wrote:

>I ran into what I think is a bug with networking interface, but I'm
>not sure what exactly is broken.
>
>If you bring the interface down (ifconfig eth1 down) and then try to
>bring it up (ifconfig eth1 up) it does not fully recover. That is, it
>shows up as RUNNING in ifconfig, you can set up ip/netmask/gw and try
>sending packets, but nothing ever shows up at the other end of the
>wire.
>
>If you unplug the ethernet cable and then plug it back in (thus
>resetting the phy, I believe?), the interface starts working again. I
>tried this with Zaius and  EVB (which have different PHYs) and it's
>broken like this on both.
>
>I suspect that as part of IFF=5FUP flag handling the kernel (drivier?)
>needs to also reconfigure the link with PHY, but it's not doing that.
>I don't know how this works in the kernel though, so I would
>appreciate any pointers to where I should start digging.
>

Is this with a real PHY or an NC-SI channel?

Do you see messages showing the link coming up after ifconfig up?

Be aware that for NC-SI attached, the kernel always enables the
state to running to be able to send and receive MAC frames to
manage the connection, and there is a secondary interface or
interface state that reflects the true link state.

Sorry I don't have the experience or resources to help further.

milton
