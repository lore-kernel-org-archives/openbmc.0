Return-Path: <miltonm@us.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=us.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=miltonm@us.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=us.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44GCkb5L3zzDqGb
 for <openbmc@lists.ozlabs.org>; Sat,  9 Mar 2019 03:34:08 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x28GPYWn042662
 for <openbmc@lists.ozlabs.org>; Fri, 8 Mar 2019 11:34:06 -0500
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.75])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2r3um19d5k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 08 Mar 2019 11:34:05 -0500
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <miltonm@us.ibm.com>;
 Fri, 8 Mar 2019 16:34:04 -0000
Received: from us1a3-smtp08.a3.dal06.isc4sb.com (10.146.103.57)
 by smtp.notes.na.collabserv.com (10.106.227.123) with
 smtp.notes.na.collabserv.com ESMTP; Fri, 8 Mar 2019 16:34:01 -0000
Received: from us1a3-mail228.a3.dal06.isc4sb.com ([10.146.103.71])
 by us1a3-smtp08.a3.dal06.isc4sb.com
 with ESMTP id 2019030816340135-650772 ;
 Fri, 8 Mar 2019 16:34:01 +0000 
In-Reply-To: <CAO9PYRLA6=1a9dsNPLj8zM5_xM9p=XUJ6gEe7-LbnFux_1+kkg@mail.gmail.com>
Subject: Re: Sensor value calculation formula
From: "Milton Miller II" <miltonm@us.ibm.com>
To: Deng Tyler <tyler.sabdon@gmail.com>
Cc: Emily Shaffer <emilyshaffer@google.com>, OpenBMC Maillist
 <openbmc@lists.ozlabs.org>
Date: Fri, 8 Mar 2019 16:34:01 +0000
MIME-Version: 1.0
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: <CAO9PYRLA6=1a9dsNPLj8zM5_xM9p=XUJ6gEe7-LbnFux_1+kkg@mail.gmail.com>,
 <CAO9PYRJjBTPEgymzS5aygU_=e2dBqDwMezFF2iOZ-Ah016dhYQ@mail.gmail.com>
 <CAJoAoZmWD_jx+qCtJV-KOXRGa0GO0w3JpOO_q4GHJ0KzR8LKuQ@mail.gmail.com>
 <CAO9PYRLkfidAqVTV-HU-SJAAdq9RARbLH8hanC+72rr03ibYNg@mail.gmail.com>
 <CAJoAoZmO1t4gougLchF-XacYVU5b7uR2qAYyXRHpjnwJNzdm6g@mail.gmail.com>
 <CAO9PYRKF5rVO7xJedEM4z7OAKLvtUU0LYJJb=rh7bUK85rJLkQ@mail.gmail.com>
 <CAJoAoZkLH8Bvsu8c1UNKdwhoxzJEGXcZ=GpdyrYt2wf_BTTWNg@mail.gmail.com>
 <CAO9PYR+t4BaVDA1+EHG9YXTf3MVd+2kf7LAiP1PcEwQvTgCgyA@mail.gmail.com>
 <CAJoAoZ=iZdB+HA1o9p1d3zgBaT9E93HpAos8PZ0fnXmcT3kJwQ@mail.gmail.com>
X-Mailer: IBM iNotes ($HaikuForm 1041) | IBM Domino Build
 SCN1812108_20180501T0841_FP30 February 15, 2019 at 14:01
X-LLNOutbound: False
X-Disclaimed: 61951
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
x-cbid: 19030816-3815-0000-0000-00000A8EA97E
X-IBM-SpamModules-Scores: BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.40962; ST=0; TS=0; UL=0; ISC=; MB=0.016445
X-IBM-SpamModules-Versions: BY=3.00010727; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000281; SDB=6.01171457; UDB=6.00612324; IPR=6.00952100; 
 BA=6.00006254; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00025895; XFM=3.00000015;
 UTC=2019-03-08 16:34:04
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2019-03-08 13:48:32 - 6.00009670
x-cbparentid: 19030816-3816-0000-0000-00000EA4DC0E
Message-Id: <OF685C7ABC.91457B7F-ON002583B7.00595194-002583B7.005B0152@notes.na.collabserv.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-03-08_14:, , signatures=0
X-Proofpoint-Spam-Reason: safe
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
X-List-Received-Date: Fri, 08 Mar 2019 16:34:16 -0000

On  03/06/2019 around 11:36PM in some timezone,  Deng Tyler wrote:

>Hi Emily
>    I found it hardcoded in phosphor-hwmon for different sensor type.
>I think that scale value may be customized for more flexible to fit
>custom platform.=20

Assuming that the sensor is exposed though a kernel sysfs hwmon
file, you should be looking to specify a gain for the file in sysfs instead.
Many sense devices already support a scale in the device tree.

>
>Tyler
>Emily Shaffer <emilyshaffer@google.com> =E6=96=BC 2019=E5=B9=B43=E6=9C=887=
=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=881:22=E5=AF=AB=E9=81=93=EF=BC=
=9A
>Tyler,
>
>Sorry that I forgot. Yes, the scale is hardcoded for certain sensor
>types, ie voltage is always millivolts. I have asked about this
>before but maybe someone else on the list can give a better answer
>why that's the case.
>

The Linux kernel hwmon API specifies the units for different sensors
as they are exposed in sysfs.  Hence the hwmon to dbus bridge can
hard code the unit for a given type of sensor.

The hwmon API is documented at=20
https://www.kernel.org/doc/Documentation/hwmon/sysfs-interface
or=20
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Doc=
umentation/hwmon/sysfs-interface

The above spec is linked as "HWMon interface" under the headings
"D-BUS" then "Path Definitions" headings in
https://github.com/openbmc/docs/blob/master/sensor-architecture.md

milton

Speaking for myself only.
