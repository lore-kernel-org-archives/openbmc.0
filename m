Return-Path: <miltonm@us.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xcRp21Qq6zDqfw
 for <openbmc@lists.ozlabs.org>; Wed, 23 Aug 2017 09:38:33 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v7MNXkqS047549
 for <openbmc@lists.ozlabs.org>; Tue, 22 Aug 2017 19:38:31 -0400
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2cgst46bke-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 22 Aug 2017 19:38:30 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <miltonm@us.ibm.com>;
 Tue, 22 Aug 2017 23:38:30 -0000
Received: from us1a3-smtp01.a3.dal06.isc4sb.com (10.106.154.95)
 by smtp.notes.na.collabserv.com (10.106.227.158) with
 smtp.notes.na.collabserv.com ESMTP; Tue, 22 Aug 2017 23:38:28 -0000
Received: from us1a3-mail79.a3.dal09.isc4sb.com ([10.142.3.136])
 by us1a3-smtp01.a3.dal06.isc4sb.com
 with ESMTP id 2017082223382759-1099211 ;
 Tue, 22 Aug 2017 23:38:27 +0000 
In-Reply-To: <1503439230-14034-1-git-send-email-eajames@linux.vnet.ibm.com>
Subject: Re: [PATCH linux dev-4.10] drivers: occ: Fix bad list access
From: "Milton Miller II" <miltonm@us.ibm.com>
To: Eddie James <eajames@linux.vnet.ibm.com>
Cc: openbmc@lists.ozlabs.org, "Edward James" <eajames@us.ibm.com>
Date: Tue, 22 Aug 2017 23:38:28 +0000
MIME-Version: 1.0
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: <1503439230-14034-1-git-send-email-eajames@linux.vnet.ibm.com>
X-Mailer: IBM iNotes ($HaikuForm 984.1) | IBM Domino Build
 SCN17206_20170725T0035 July 25, 2017 at 00:35
X-LLNOutbound: False
X-Disclaimed: 1815
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
x-cbid: 17082223-6059-0000-0000-000005584E54
X-IBM-SpamModules-Scores: FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0; SC=0.40962;
 ST=0; TS=0; UL=0; ISC=; MB=0.000010
X-IBM-SpamModules-Versions: BY=3.00007593; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000223; SDB=6.00906216; UDB=6.00454183; IPR=6.00686417; 
 BA=6.00005550; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00016817; XFM=3.00000015;
 UTC=2017-08-22 23:38:29
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2017-08-22 21:37:58 - 6.00007219
x-cbparentid: 17082223-6060-0000-0000-00005A5BBB0B
Message-Id: <OFB63E98C0.BB7C3106-ON00258184.0081DD4F-00258184.0081DD58@notes.na.collabserv.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-08-22_09:, , signatures=0
X-Proofpoint-Spam-Reason: safe
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
X-List-Received-Date: Tue, 22 Aug 2017 23:38:34 -0000

On 08/22/2017 about 05:00PM in some time zone, Eddie James wrote:
>list=5Ffirst=5Fentry() doesn't return NULL if the list is empty...
>
>Signed-off-by: Edward A. James <eajames@us.ibm.com>

Reviewed-by: Milton Miller <miltonm@us.ibm.com>

>---
> drivers/fsi/occ.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/drivers/fsi/occ.c b/drivers/fsi/occ.c
>index d984e51..621fbf0 100644
>--- a/drivers/fsi/occ.c
>+++ b/drivers/fsi/occ.c
>@@ -572,7 +572,7 @@ static void occ=5Fworker(struct work=5Fstruct *work)
> again:
> 	spin=5Flock=5Firq(&occ->list=5Flock);
>=20
>-	xfr =3D list=5Ffirst=5Fentry(&occ->xfrs, struct occ=5Fxfr, link);
>+	xfr =3D list=5Ffirst=5Fentry=5For=5Fnull(&occ->xfrs, struct occ=5Fxfr, l=
ink);
> 	if (!xfr) {
> 		spin=5Funlock=5Firq(&occ->list=5Flock);
> 		return;


Its a bit unusual that the entry is left on the list while the work=20
is being performed, requiring the list lock to be acquired at the=20
end.  But I don't see anything wrong with the locking and mutexes=20
(assuming that lockdep would have complained about client lock=20
nesting inside occ lock).

Without this fix, if there is an underflow the data around the list
head will be interpreted as a workqueue request.

milton
