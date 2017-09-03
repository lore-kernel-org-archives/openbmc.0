Return-Path: <miltonm@us.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xlD2C4JRQzDq5k
 for <openbmc@lists.ozlabs.org>; Sun,  3 Sep 2017 10:12:34 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v8309WBL040333
 for <openbmc@lists.ozlabs.org>; Sat, 2 Sep 2017 20:12:30 -0400
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.67])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2cqpt3sc3m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Sat, 02 Sep 2017 20:12:30 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <miltonm@us.ibm.com>;
 Sun, 3 Sep 2017 00:12:29 -0000
Received: from us1a3-smtp04.a3.dal06.isc4sb.com (10.106.154.237)
 by smtp.notes.na.collabserv.com (10.106.227.16) with
 smtp.notes.na.collabserv.com ESMTP; Sun, 3 Sep 2017 00:12:25 -0000
Received: from us1a3-mail79.a3.dal09.isc4sb.com ([10.142.3.136])
 by us1a3-smtp04.a3.dal06.isc4sb.com
 with ESMTP id 2017090300122562-462383 ;
 Sun, 3 Sep 2017 00:12:25 +0000 
In-Reply-To: <20170626230559.GB31439@asimov.austin.ibm.com>
Subject: Re: Switch up eth0 and eth1 to BMC shared and dedicated resp. ( Zaius
 )
From: "Milton Miller II" <miltonm@us.ibm.com>
To: Patrick Williams <patrick@stwcx.xyz>
Cc: Joel Stanley <joel@jms.id.au>, brad.debauche@rackspace.com,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, "Adriana Kobylak"
 <anoo@us.ibm.com>, adi.gangidi@rackspace.com, Chad Somerlot
 <chad.somerlot@rackspace.com>, ryan.dc.yu@foxconn.com, "Adrian Barrera"
 <abarrera@us.ibm.com>
Date: Sun, 3 Sep 2017 00:12:24 +0000
MIME-Version: 1.0
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: <20170626230559.GB31439@asimov.austin.ibm.com>,
 <EDE9FA85-CF2B-4B72-9974-1E92EE9EC676@rackspace.com>
 <1497022202970.71679@rackspace.com>
 <OF6B672B6D.E6759427-ON0025813A.005D800E-0025813A.005DB2CB@notes.na.collabserv.com>
 <CACPK8Xdi8bQWYc5QErBi2rJgMfEHLLOdBW7MoasUdK2tpk-GaQ@mail.gmail.com>
X-Mailer: IBM iNotes ($HaikuForm 991.1) | IBM Domino Build
 SCN17220_20170808T0032_FP2.2 August 28, 2017 at 11:51
X-LLNOutbound: False
X-Disclaimed: 3007
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
x-cbid: 17090300-0327-0000-0000-000002C97055
X-IBM-SpamModules-Scores: BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.388783; ST=0; TS=0; UL=0; ISC=; MB=0.047069
X-IBM-SpamModules-Versions: BY=3.00007655; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000226; SDB=6.00911384; UDB=6.00457221; IPR=6.00691645; 
 BA=6.00005566; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00016981; XFM=3.00000015;
 UTC=2017-09-03 00:12:28
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2017-09-02 23:02:06 - 6.00007272
x-cbparentid: 17090300-0328-0000-0000-000016615FCB
Message-Id: <OFD21E73B3.5251B12C-ON00258190.00001610-00258190.00012303@notes.na.collabserv.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-09-02_09:, , signatures=0
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
X-List-Received-Date: Sun, 03 Sep 2017 00:12:36 -0000

On 06/26/2017 about 06:06PM, Patrick Williams wrote:
>On Thu, Jun 15, 2017 at 03:00:30PM +0930, Joel Stanley wrote:
>> On Sat, Jun 10, 2017 at 2:33 AM, Adriana Kobylak <anoo@us.ibm.com>
>wrote:
>> > From: Adi Gangidi
>> > Sent: Friday, June 9, 2017 10:06 AM
>> > To: anoo@us.ibm.com; Kenneth Wilke; Brad DeBauche; Chad Somerlot;
>> > abarrera@us.ibm.com; ryan.dc.yu@foxconn.com; Rob Lippert
>> > Subject: Switch up eth0 and eth1 to BMC shared and dedicated
>resp. ( Zaius )
>> >
>> > Hi Adriana /.  Ryan ( Foxconn )
>> >
>> > Right now on openBMC
>> > BMC Shared      =3D eth0
>> > BMC Dedicated =3D eth1
>> >
>> >
>> > Instead, Is there a way we can make sure the BMC dedicated comes
>up as eth0
>> > and BMC shared link comes up as eth1, in Zaius / Barreleye G2 ?
>> >
>> >
>> > In how it works currently . you could have BMC dedicated be eth0
>or eth1
>> > depending upon the hardware config ( Whether or not Broadcom
>5719A is popped
>> > OR de-popped ) . That could confusing to support operators who
>don't
>> > understand the nuances .
>> >
>> > If you guys are busy with other things to make the change  , can
>I have your
>> > thoughts on if this can be changed ? I'm guessing this is a
>u-boot change .
>> > Any thoughts on how we could make this change ourselves ?
>>=20
>> You can use a udev rule to ensure the devices are named as you
>expect.
>
>Most Linux distros have moved away from 'ethN' style naming and to
>"something else".  My laptop's network interfaces are named
>'enp0s31f6'
>and 'wlp4s0' for the ethernet and wireless interfaces respectively.
>
>https://www.freedesktop.org/wiki/Software/systemd/PredictableNetworkI
>nterfaceNames/
>
>According to that, the default order of naming we should be getting
>is something
>like this:
>
>1. Names incorporating Firmware/BIOS provided index numbers for
>on-board devices (example: eno1)
>2. Names incorporating Firmware/BIOS provided PCI Express hotplug
>slot index numbers (example: ens1)
>3. Names incorporating physical/geographical location of the
>connector of the hardware (example: enp2s0)
>4. Classic, unpredictable kernel-native ethX naming (example: eth0)
>
>Any idea why we are ending up with #4?  Is this due to device tree
>entries / naming?  It seems like using something like #3 would get
>well
>defined and consistent names no matter which network interface is
>enabled.  It should also, in theory, make all AST2400 chips arrive at
>the same names for NC-SI vs direct PHY.
>

Upstream has udev rules to name PCI devices.  Our NICs are not PCI
devices.  We don't have any BIOS or interface to firmware and I am
not aware of any standard for device tree labeling of connectors[1].

I don't think it makes sense to name the pins on the chip, I would
want to follow the phy(s) for the mac(s).


[1] other than something like ibm,location-code in PAPR.

milton
