Return-Path: <miltonm@us.ibm.com>
Received: from e33.co.us.ibm.com (e33.co.us.ibm.com [32.97.110.151])
 (using TLSv1 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 745AE1A03F8
 for <openbmc@lists.ozlabs.org>; Fri, 22 Jan 2016 10:17:52 +1100 (AEDT)
Received: from localhost
 by e33.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <miltonm@us.ibm.com>;
 Thu, 21 Jan 2016 16:17:50 -0700
Received: from d03dlp01.boulder.ibm.com (9.17.202.177)
 by e33.co.us.ibm.com (192.168.1.133) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 21 Jan 2016 16:17:47 -0700
X-IBM-Helo: d03dlp01.boulder.ibm.com
X-IBM-MailFrom: miltonm@us.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by d03dlp01.boulder.ibm.com (Postfix) with ESMTP id 83D2F1FF0042
 for <openbmc@lists.ozlabs.org>; Thu, 21 Jan 2016 16:05:57 -0700 (MST)
Received: from d03av01.boulder.ibm.com (d03av01.boulder.ibm.com [9.17.195.167])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u0LNHliI28311558
 for <openbmc@lists.ozlabs.org>; Thu, 21 Jan 2016 16:17:47 -0700
Received: from d03av01.boulder.ibm.com (localhost [127.0.0.1])
 by d03av01.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u0LNHk6h027962
 for <openbmc@lists.ozlabs.org>; Thu, 21 Jan 2016 16:17:46 -0700
Received: from e39.co.us.ibm.com (e39.boulder.ibm.com [9.17.249.49])
 by d03av01.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u0LNHk9H027952
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Thu, 21 Jan 2016 16:17:46 -0700
Message-Id: <201601212317.u0LNHk9H027952@d03av01.boulder.ibm.com>
Received: from localhost
 by e39.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <miltonm@us.ibm.com>;
 Thu, 21 Jan 2016 16:17:46 -0700
Received: from smtp.notes.na.collabserv.com (192.155.248.81)
 by e39.co.us.ibm.com (192.168.2.139) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256/256)
 Thu, 21 Jan 2016 16:17:44 -0700
X-IBM-Helo: smtp.notes.na.collabserv.com
X-IBM-MailFrom: miltonm@us.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from /spool/local
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <miltonm@us.ibm.com>;
 Thu, 21 Jan 2016 23:17:43 -0000
Received: from us1a3-smtp02.a3.dal06.isc4sb.com (10.106.154.103)
 by smtp.notes.na.collabserv.com (10.106.227.88) with
 smtp.notes.na.collabserv.com ESMTP; Thu, 21 Jan 2016 23:17:42 -0000
Received: from us1a3-mail79.a3.dal09.isc4sb.com ([10.142.3.136])
 by us1a3-smtp02.a3.dal06.isc4sb.com
 with ESMTP id 2016012123185758-464886 ;
 Thu, 21 Jan 2016 23:18:57 +0000 
In-Reply-To: <56A0773F.6000109@ozlabs.org>
Subject: Re: [PATCH openbmc 4/6] u-boot : switch to repro, add fw_env.config
From: "Milton Miller II" <miltonm@us.ibm.com>
To: Jeremy Kerr <jk@ozlabs.org>
Cc: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org
Date: Thu, 21 Jan 2016 23:17:41 +0000
Sensitivity: 
MIME-Version: 1.0
Importance: Normal
X-Priority: 3 (Normal)
References: <56A0773F.6000109@ozlabs.org>,
 <1453331420-6524-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1453331420-6524-5-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: Lotus Domino Web Server Build V851SAAS_01112016_FP3 January 19, 2016
X-LLNOutbound: False
X-Disclaimed: 10779
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
x-cbid: 16012123-0009-0000-0000-000011A471FF
X-IBM-ISS-SpamDetectors: Score=0.40962; BY=0.000285; FL=0; FP=0; FZ=0; HX=0;
 KW=0; PH=0; SC=0.40962; ST=0; TS=0; UL=0; ISC=
X-IBM-ISS-DetailInfo: BY=3.00004825; HX=3.00000239; KW=3.00000007;
 PH=3.00000004; SC=3.00000135; SDB=6.00648637; UDB=6.00293063; UTC=2016-01-21
 23:17:43
x-cbparentid: 16012123-4536-0000-0000-000005CC0397
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
X-Mailman-Approved-At: Fri, 22 Jan 2016 10:37:03 +1100
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 21 Jan 2016 23:17:53 -0000



-----Jeremy Kerr <jk@ozlabs.org> wrote: -----
>> +# SRCREV =3D "62c175fbb8a0f9a926c88294ea9f7e88eb898f6c"
>> +SRCREV=3D"${AUTOREV}"
>> +
>
> We should use a tag here. Just to confirm, you've tested against
> c45e7515, right?

no

> Or should we be using the v2013.07-aspeed-openbmc branch, currently at
> e00b3cc6?=09


It was e00b3cc6 see:

+UBRANCH =3D "v2013.07-aspeed-openbmc"
+SRC=5FURI =3D "git://git@github.com/openbmc/u-boot.git;branch=3D${UBRANCH}=
;protocol=3Dhttps"
