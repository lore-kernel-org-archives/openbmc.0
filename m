Return-Path: <shliyi@cn.ibm.com>
X-Greylist: delayed 722 seconds by postgrey-1.36 at bilbo;
 Wed, 16 Nov 2016 22:00:19 AEDT
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.73])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tJh9v17dyzDvmn
 for <openbmc@lists.ozlabs.org>; Wed, 16 Nov 2016 22:00:18 +1100 (AEDT)
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <shliyi@cn.ibm.com>;
 Wed, 16 Nov 2016 10:48:12 -0000
Received: from us1a3-smtp05.a3.dal06.isc4sb.com (10.146.71.159)
 by smtp.notes.na.collabserv.com (10.106.227.90) with
 smtp.notes.na.collabserv.com ESMTP; Wed, 16 Nov 2016 10:48:08 -0000
X-IBM-Helo: us1a3-smtp05.a3.dal06.isc4sb.com
X-IBM-MailFrom: shliyi@cn.ibm.com
X-IBM-RcptTo: dkodihal@linux.vnet.ibm.com;openbmc@lists.ozlabs.org
Received: from us1a3-mail141.a3.dal06.isc4sb.com ([10.146.38.85])
 by us1a3-smtp05.a3.dal06.isc4sb.com
 with ESMTP id 2016111610480693-96150 ;
 Wed, 16 Nov 2016 10:48:06 +0000 
MIME-Version: 1.0
In-Reply-To: <0ec0dd36-c0c4-ac1e-6e7b-8dbb73196a78@linux.vnet.ibm.com>
Subject: Re: D-Bus interfaces for FRU VPD inventory
To: Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Message-ID: <OFBF350957.8F8AAB7A-ON4825806D.0037DBBB-4825806D.003B431A@notes.na.collabserv.com>
From: "Yi TZ Li" <shliyi@cn.ibm.com>
Date: Wed, 16 Nov 2016 18:47:18 +0800
References: <0ec0dd36-c0c4-ac1e-6e7b-8dbb73196a78@linux.vnet.ibm.com>
X-KeepSent: BF350957:8F8AAB7A-4825806D:0037DBBB;
 type=4; name=$KeepSent
X-Mailer: IBM Notes Release 9.0.1EXT September 15, 2015
X-Disclaimed: 50135
X-TNEFEvaluated: 1
Content-type: multipart/alternative; 
 Boundary="0__=C7BB0AFEDFA45D2B8f9e8a93df938690918cC7BB0AFEDFA45D2B"
Content-Disposition: inline
x-cbid: 16111610-3108-0000-0000-000001CCA1D3
X-IBM-ISS-SpamDetectors: Score=0.429909; BY=0.230065; FL=0; FP=0; FZ=0; HX=0; 
 KW=0; PH=0; SC=0.429909; ST=0; TS=0; UL=0; ISC=
X-IBM-ISS-DetailInfo: BY=3.00006087; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000189; SDB=6.00781413; UDB=6.00376938; UTC=2016-11-16
 10:48:10
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
X-List-Received-Date: Wed, 16 Nov 2016 11:00:19 -0000


--0__=C7BB0AFEDFA45D2B8f9e8a93df938690918cC7BB0AFEDFA45D2B
Content-Transfer-Encoding: quoted-printable
Content-type: text/plain; charset=US-ASCII


Hi Deepak,

I am reading your patch: https://gerrit.openbmc-project.xyz/#/c/1095/ and
https://gerrit.openbmc-project.xyz/#/c/1094/,
and the DBus interfaces you proposed.

But I might miss some background information, hoping you could help:

Please see my questions bellow:

> From: Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>
> To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
> Date: 11/14/2016 02:59 PM
> Subject: D-Bus interfaces for FRU VPD inventory
> Sent by: "openbmc" <openbmc-bounces+shliyi=3Dcn.ibm.com@lists.ozlabs.org>
>
> Hello,
>
> I'd like to solicit feedback on the d-bus interfaces that we're
> defining to represent FRU information, also known as FRU VPD (Vital
> Product Data).
>
> A little background :
>
> - The d-bus interfaces are being written as Inventory interfaces, as
> YAML files, under the openbmc/phosphor-dbus-interfaces repo [1].

What is the relationship between the YAML files in
openbmc/phosphor-dbus-interfaces, and openbmc/phosphor-inventory-manager?
Will phosphor-inventory-manager (PIM) uses the YAML files to generate dbus
objects for FRU/VPD?

> - As far as sources/formats of VPD are concerned, we've looked at
> the IPMI FRU information spec [2], and the open-power VPD format [3].

Will BMC read and parse open-power format VPD? As I understand, Hostboot
parses those VPD and send them to BMC as IPMI FRU format.
Will BMC do the same thing as Hostboot?

> - The goal has been to define properties in the d-bus interfaces to
> describe various pieces of FRU VPD, and to describe them in such a
> way that they're agnostic to the VPD format. It would be up to VPD
> related applications to parse specific VPD formats and then to
> populate the Inventory via the new d-bus interfaces.
> - There are in general two classes of interfaces : those describing
> physical items such as processors, DIMMs, etc.; and those describing
> virtual items such as a replaceable item, a repairable item, an item
> having voltage control enabled, etc.

Could you give an example of the "virtual items"?
Also there are other FRU items like PCIE card, HDD. How to handle them in
the new inventory framework?

Thanks,
-Yi

--0__=C7BB0AFEDFA45D2B8f9e8a93df938690918cC7BB0AFEDFA45D2B
Content-Transfer-Encoding: quoted-printable
Content-type: text/html; charset=US-ASCII
Content-Disposition: inline

<html><body><p><tt>Hi Deepak,</tt><br><br><tt>I am reading your patch: </tt=
><a href=3D"https://gerrit.openbmc-project.xyz/#/c/1095/"><tt>https://gerri=
t.openbmc-project.xyz/#/c/1095/</tt></a><tt>&nbsp;and </tt><a href=3D"https=
://gerrit.openbmc-project.xyz/#/c/1094/"><tt>https://gerrit.openbmc-project=
.xyz/#/c/1094/</tt></a><tt>,</tt><br><tt>and the DBus interfaces you propos=
ed.</tt><br><br><tt>But I might miss some background information, hoping yo=
u could help:</tt><br><br><tt>Please see my questions bellow:<br><br>&gt; F=
rom: Deepak Kodihalli &lt;dkodihal@linux.vnet.ibm.com&gt;</tt><br><tt>&gt; =
To: OpenBMC Maillist &lt;openbmc@lists.ozlabs.org&gt;</tt><br><tt>&gt; Date=
: 11/14/2016 02:59 PM</tt><br><tt>&gt; Subject: D-Bus interfaces for FRU VP=
D inventory</tt><br><tt>&gt; Sent by: &quot;openbmc&quot; &lt;openbmc-bounc=
es+shliyi=3Dcn.ibm.com@lists.ozlabs.org&gt;</tt><br><tt>&gt; <br>&gt; Hello=
,<br>&gt; <br>&gt; I'd like to solicit feedback on the d-bus interfaces tha=
t we're <br>&gt; defining to represent FRU information, also known as FRU V=
PD (Vital <br>&gt; Product Data).<br>&gt; <br>&gt; A little background :<br=
>&gt; <br>&gt; - The d-bus interfaces are being written as Inventory interf=
aces, as<br>&gt; YAML files, under the openbmc/phosphor-dbus-interfaces rep=
o [1].</tt><br><br><tt>What is the relationship between the YAML files in o=
penbmc/phosphor-dbus-interfaces, and openbmc/phosphor-inventory-manager?</t=
t><br><tt>Will phosphor-inventory-manager (PIM) uses the YAML files to gene=
rate dbus objects for FRU/VPD?</tt><br><tt><br>&gt; - As far as sources/for=
mats of VPD are concerned, we've looked at <br>&gt; the IPMI FRU informatio=
n spec [2], and the open-power VPD format [3].</tt><br><br><tt>Will BMC rea=
d and parse open-power format VPD? As I understand, Hostboot parses those V=
PD and send them to BMC as IPMI FRU format.</tt><br><tt>Will BMC do the sam=
e thing as Hostboot?</tt><br><tt><br>&gt; - The goal has been to define pro=
perties in the d-bus interfaces to <br>&gt; describe various pieces of FRU =
VPD, and to describe them in such a <br>&gt; way that they're agnostic to t=
he VPD format. It would be up to VPD <br>&gt; related applications to parse=
 specific VPD formats and then to <br>&gt; populate the Inventory via the n=
ew d-bus interfaces.<br>&gt; - There are in general two classes of interfac=
es : those describing <br>&gt; physical items such as processors, DIMMs, et=
c.; and those describing<br>&gt; virtual items such as a replaceable item, =
a repairable item, an item<br>&gt; having voltage control enabled, etc.</tt=
><br><br><tt>Could you give an example of the &quot;virtual items&quot;?</t=
t><br><tt>Also there are other FRU items like PCIE card, HDD. How to handle=
 them in the new inventory framework?</tt><br><tt><br>Thanks,</tt><br><tt>-=
Yi</tt><BR>
</body></html>

--0__=C7BB0AFEDFA45D2B8f9e8a93df938690918cC7BB0AFEDFA45D2B--
