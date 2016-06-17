Return-Path: <vishwanath@in.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rWJ3R525kzDqvY
 for <openbmc@lists.ozlabs.org>; Fri, 17 Jun 2016 21:30:59 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.11/8.16.0.11) with SMTP id
 u5HBTkRI131501
 for <openbmc@lists.ozlabs.org>; Fri, 17 Jun 2016 07:30:54 -0400
Received: from e28smtp04.in.ibm.com (e28smtp04.in.ibm.com [125.16.236.4])
 by mx0b-001b2d01.pphosted.com with ESMTP id 23jswdrrrm-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 17 Jun 2016 07:30:54 -0400
Received: from localhost
 by e28smtp04.in.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <vishwanath@in.ibm.com>;
 Fri, 17 Jun 2016 17:00:50 +0530
Received: from d28dlp03.in.ibm.com (9.184.220.128)
 by e28smtp04.in.ibm.com (192.168.1.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Fri, 17 Jun 2016 17:00:45 +0530
X-IBM-Helo: d28dlp03.in.ibm.com
X-IBM-MailFrom: vishwanath@in.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from d28relay04.in.ibm.com (d28relay04.in.ibm.com [9.184.220.61])
 by d28dlp03.in.ibm.com (Postfix) with ESMTP id 0299E1258060
 for <openbmc@lists.ozlabs.org>; Fri, 17 Jun 2016 17:03:18 +0530 (IST)
Received: from d50lp01.ny.us.ibm.com (d50lp01.pok.ibm.com [146.89.104.207])
 by d28relay04.in.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u5HBU3rI8520190
 for <openbmc@lists.ozlabs.org>; Fri, 17 Jun 2016 17:00:04 +0530
Received: from localhost
 by d50lp01.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <vishwanath@in.ibm.com>;
 Fri, 17 Jun 2016 07:30:42 -0400
Received: from smtp.notes.na.collabserv.com (192.155.248.75)
 by d50lp01.ny.us.ibm.com (158.87.18.20) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256/256)
 Fri, 17 Jun 2016 07:30:41 -0400
X-IBM-Helo: smtp.notes.na.collabserv.com
X-IBM-MailFrom: vishwanath@in.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from /spool/local
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <vishwanath@in.ibm.com>;
 Fri, 17 Jun 2016 11:30:40 -0000
Received: from us1a3-smtp02.a3.dal06.isc4sb.com (10.106.154.159)
 by smtp.notes.na.collabserv.com (10.106.227.123) with
 smtp.notes.na.collabserv.com ESMTP; Fri, 17 Jun 2016 11:30:39 -0000
Received: from us1a3-mail58.a3.dal09.isc4sb.com ([10.142.3.114])
 by us1a3-smtp02.a3.dal06.isc4sb.com
 with ESMTP id 2016061711303888-207732 ;
 Fri, 17 Jun 2016 11:30:38 +0000 
MIME-Version: 1.0
In-Reply-To: <20160616184811.GB19968@asimov.austin.ibm.com>
Subject: Re: Fw: Need some thoughts on systemd service file
To: Patrick Williams <patrick@stwcx.xyz>
Cc: openbmc@lists.ozlabs.org
From: "Vishwanatha Subbanna" <vishwanath@in.ibm.com>
Date: Fri, 17 Jun 2016 17:00:36 +0530
References: <OF27BAEC52.32D2FF79-ON65257FD4.0060E8C5-65257FD4.0061238B@notes.na.collabserv.com>
 <20160616184811.GB19968@asimov.austin.ibm.com>
X-KeepSent: F99BCDC6:59378F04-65257FD5:003EE252;
 type=4; name=$KeepSent
X-Mailer: IBM Notes Release 9.0.1EXT SHF692 April 27, 2016
X-LLNOutbound: False
X-Disclaimed: 10667
X-TNEFEvaluated: 1
Content-type: multipart/alternative; 
 Boundary="0__=EABBF546DFAD64C28f9e8a93df938690918cEABBF546DFAD64C2"
Content-Disposition: inline
x-cbid: 16061711-0012-0000-0000-0000029E37E1
X-IBM-ISS-SpamDetectors: Score=0.383848; BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0;
 PH=0; SC=0.383848; ST=0; TS=0; UL=0; ISC=
X-IBM-ISS-DetailInfo: BY=3.00005394; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000170; SDB=6.00717554; UDB=6.00334511; UTC=2016-06-17
 11:30:40
x-cbparentid: 16061711-9818-0000-0000-000000C0D832
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
X-Content-Scanned: Fidelis XPS MAILER
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
Message-Id: <OFF99BCDC6.59378F04-ON65257FD5.003EE252-65257FD5.003F3A3B@notes.na.collabserv.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2016-06-17_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1604210000
 definitions=main-1606170139
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
X-List-Received-Date: Fri, 17 Jun 2016 11:31:00 -0000


--0__=EABBF546DFAD64C28f9e8a93df938690918cEABBF546DFAD64C2
Content-Transfer-Encoding: quoted-printable
Content-type: text/plain; charset=US-ASCII

hey Patrick,

Patrick Williams <patrick@stwcx.xyz> wrote on 17/06/2016 12:18:11 am:

> From: Patrick Williams <patrick@stwcx.xyz>
> To: Vishwanatha Subbanna/India/IBM@IBMIN
> Cc: openbmc@lists.ozlabs.org
> Date: 17/06/2016 12:18 am
> Subject: Re: Fw: Need some thoughts on systemd service file
>
> Vishwa,
>
> A few suggestions on your commit:
>
> 1. I see you put the files into .../network/files/ and moved them from
> .../network/network/ .  Why is that?
>

That is just an attempt to see if moving to files/ would do any magic.. I
moved them back to network/network/ now.

> 2. 'inherit obmc-phosphor-systemd' causes your recipe to import
> obmc-phosphor-systemd.bbclass.  This file has:
> =3D=3D=3D=3D
> inherit systemd
>
> SYSTEMD=5FSERVICE=5F${PN} =3D "${BPN}.service"
> SRC=5FURI +=3D " \
>     file://${BPN}.service \
>     "
>
> do=5Finstall=5Fappend() {
>     # install systemd unit files
>     install -d ${D}${systemd=5Funitdir}/system
>     install -m 0644 ${WORKDIR}/${BPN}.service ${D}$
{systemd=5Funitdir}/system
> }
> =3D=3D=3D=3D=3D
> This means a few things...
>     a. By setting SYSTEMD=5FSERVICE=5F${PN} +=3D "network.service", you're
>        actually getting network.service added twice.
>     b. network.service will be installed by this do=5Finstall=5Fappend
>        snippet, but network-update-dns.service will not.  I think you
>        need to 'install' it.
>     c. I'm surprised we don't 'install' everything in
>        SYSTEMD=5FSERVICE=5F${PN} automatically or in this .bbclass.  Maybe
>        Brad can comment on why it is set up this way.
>
> 3. Before you made your change are we sure 'network.service' was
> working?  Hopefully someone has previously tested this but there is
> always the possibility that systemd is confused by 'network.service' vs
> 'network.target'.  Maybe 'network' is effectively a reserved word.
>

Since I see manual starting with "systemctl start network" is working, it
would not have an issue IMO.
Do you suggest a better name tho ?

> 4. There is no advantage to setting SYSTEMD=5FAUTO=5FENABLE because it is
> already defaulted to 'enable'.
>

Correct. This is again with the hope that things may work. I removed this
in the next patch.

> On Thu, Jun 16, 2016 at 11:11:00PM +0530, Vishwanatha Subbanna wrote:
> >
> >
> > hello Team,
> >
> > So here is what I am trying to do with :
> > https://github.com/vishwabmc/openbmc/commit/
> f28651bb92bc7af6b503c9ca07aa8d76a3f0660c
> >
> > 1/. Point bb to the git repo with commit #
> > c69c3d30fd7d5fd04ba990788b6d75b19f275fc8 that introduced
netman=5Fwatch=5Fdns
> > binary
> > 2/. Create 2 .service files inside
> > meta-phosphor/common/recipes-phosphor/network/files/ -->
network.service
> > and network-update-dns.service
> > 3/  Make necessary changes to bitbake file so systemd can enable the
> > services and start at boot.
> > 4/. Build a Palmetto image ( or qemu too ) and copy 'em over to
tftpserver
> > ( /tftpboot/cuImage=5Fvishwa=5F1 and /tftpboot/initrd=5Fvishwa=5F1 )
> > 5/. reboot palmetto and run netboot to new image.
> >
> > I expected that the netman.py ( which is part of network.service ) and
> > netman=5Fwatch=5Fdns ( part of network-update-dns.service ) would get a=
uto
> > started but they did *not* start and I need some thoughts on why this
may
> > be happening.
> >
> > https://lists.yoctoproject.org/pipermail/yocto/2015-April/024470.html
> > ( Someone else also had same issue )
> >
> > What is that I am seeing :
> >
> > 1/. I see these 2 files are actually inside /lib/systemd/system/network
> > Palmetto in as expected --> Good
> > 2/. Services not started
> > 3/. systemctl status network shows that its disabled. Same for
update-dns.
> > 4/. I see systemctl status skeleton displays everything is running
> > 4.1/ Removing the Requires=3D and After=3D in network.service and booti=
ng
to
> > that changed image still does not help.
> > 5/. Manual start using systemctl start network -and/or- systemctl start
> > network-update-dns does everything okay and starts the expected
services.
> > 6/. No error seen in journal
> >
> > Thanks
> >
> >
>
---------------------------------------------------------------------------=
----------

> >
> > Thanks and Regards,
> > Vishwanath.
> > Advisory Software Engineer,
> > Power Firmware Development,
> > Systems &Technology Lab,
> > MG2-6F-255 , Manyata Embassy Business Park,
> > Bangalore , KA , 560045
> > Ph: +91-80-46678255
> > E-mail: vishwanath@in.ibm.com
> >
>
---------------------------------------------------------------------------=
-------

> >
>
> > =5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F
> > openbmc mailing list
> > openbmc@lists.ozlabs.org
> > https://lists.ozlabs.org/listinfo/openbmc
>
>
> --
> Patrick Williams
> [attachment "signature.asc" deleted by Vishwanatha Subbanna/India/IBM]

--0__=EABBF546DFAD64C28f9e8a93df938690918cEABBF546DFAD64C2
Content-Transfer-Encoding: quoted-printable
Content-type: text/html; charset=US-ASCII
Content-Disposition: inline

<html><body><p>hey Patrick,<br><br><tt>Patrick Williams &lt;patrick@stwcx.x=
yz&gt; wrote on 17/06/2016 12:18:11 am:<br><br>&gt; From: Patrick Williams =
&lt;patrick@stwcx.xyz&gt;</tt><br><tt>&gt; To: Vishwanatha Subbanna/India/I=
BM@IBMIN</tt><br><tt>&gt; Cc: openbmc@lists.ozlabs.org</tt><br><tt>&gt; Dat=
e: 17/06/2016 12:18 am</tt><br><tt>&gt; Subject: Re: Fw: Need some thoughts=
 on systemd service file</tt><br><tt>&gt; <br>&gt; Vishwa,<br>&gt; <br>&gt;=
 A few suggestions on your commit:<br>&gt; <br>&gt; 1. I see you put the fi=
les into .../network/files/ and moved them from<br>&gt; .../network/network=
/ . &nbsp;Why is that?<br>&gt; </tt><br><br><tt>That is just an attempt to =
see if moving to files/ would do any magic.. I moved them back to network/n=
etwork/ now.</tt><br><tt><br>&gt; 2. 'inherit obmc-phosphor-systemd' causes=
 your recipe to import<br>&gt; obmc-phosphor-systemd.bbclass. &nbsp;This fi=
le has:<br>&gt; =3D=3D=3D=3D<br>&gt; inherit systemd<br>&gt; <br>&gt; SYSTE=
MD=5FSERVICE=5F${PN} =3D &quot;${BPN}.service&quot;<br>&gt; SRC=5FURI +=3D =
&quot; \<br>&gt; &nbsp; &nbsp; <a href=3D"file://$">file://$</a>{BPN}.servi=
ce \<br>&gt; &nbsp; &nbsp; &quot;<br>&gt; <br>&gt; do=5Finstall=5Fappend() =
{<br>&gt; &nbsp; &nbsp; # install systemd unit files<br>&gt; &nbsp; &nbsp; =
install -d ${D}${systemd=5Funitdir}/system<br>&gt; &nbsp; &nbsp; install -m=
 0644 ${WORKDIR}/${BPN}.service ${D}${systemd=5Funitdir}/system<br>&gt; }<b=
r>&gt; =3D=3D=3D=3D=3D<br>&gt; This means a few things...<br>&gt; &nbsp; &n=
bsp; a. By setting SYSTEMD=5FSERVICE=5F${PN} +=3D &quot;network.service&quo=
t;, you're<br>&gt; &nbsp; &nbsp; &nbsp; &nbsp;actually getting network.serv=
ice added twice.<br>&gt; &nbsp; &nbsp; b. network.service will be installed=
 by this do=5Finstall=5Fappend<br>&gt; &nbsp; &nbsp; &nbsp; &nbsp;snippet, =
but network-update-dns.service will not. &nbsp;I think you<br>&gt; &nbsp; &=
nbsp; &nbsp; &nbsp;need to 'install' it.<br>&gt; &nbsp; &nbsp; c. I'm surpr=
ised we don't 'install' everything in<br>&gt; &nbsp; &nbsp; &nbsp; &nbsp;SY=
STEMD=5FSERVICE=5F${PN} automatically or in this .bbclass. &nbsp;Maybe<br>&=
gt; &nbsp; &nbsp; &nbsp; &nbsp;Brad can comment on why it is set up this wa=
y.<br>&gt; <br>&gt; 3. Before you made your change are we sure 'network.ser=
vice' was<br>&gt; working? &nbsp;Hopefully someone has previously tested th=
is but there is<br>&gt; always the possibility that systemd is confused by =
'network.service' vs<br>&gt; 'network.target'. &nbsp;Maybe 'network' is eff=
ectively a reserved word.<br>&gt; </tt><br><br><tt>Since I see manual start=
ing with &quot;systemctl start network&quot; is working, it would not have =
an issue IMO. </tt><br><tt>Do you suggest a better name tho ?</tt><br><tt><=
br>&gt; 4. There is no advantage to setting SYSTEMD=5FAUTO=5FENABLE because=
 it is<br>&gt; already defaulted to 'enable'.<br>&gt; </tt><br><br><tt>Corr=
ect. This is again with the hope that things may work. I removed this in th=
e next patch.</tt><br><tt><br>&gt; On Thu, Jun 16, 2016 at 11:11:00PM +0530=
, Vishwanatha Subbanna wrote:<br>&gt; &gt; <br>&gt; &gt; <br>&gt; &gt; hell=
o Team,<br>&gt; &gt; <br>&gt; &gt; So here is what I am trying to do with :=
<br>&gt; &gt; <a href=3D"https://github.com/vishwabmc/openbmc/commit/">http=
s://github.com/vishwabmc/openbmc/commit/</a><br>&gt; f28651bb92bc7af6b503c9=
ca07aa8d76a3f0660c<br>&gt; &gt; <br>&gt; &gt; 1/. Point bb to the git repo =
with commit #<br>&gt; &gt; c69c3d30fd7d5fd04ba990788b6d75b19f275fc8 that in=
troduced netman=5Fwatch=5Fdns<br>&gt; &gt; binary<br>&gt; &gt; 2/. Create 2=
 .service files inside<br>&gt; &gt; meta-phosphor/common/recipes-phosphor/n=
etwork/files/ --&gt; network.service<br>&gt; &gt; and network-update-dns.se=
rvice<br>&gt; &gt; 3/ &nbsp;Make necessary changes to bitbake file so syste=
md can enable the<br>&gt; &gt; services and start at boot.<br>&gt; &gt; 4/.=
 Build a Palmetto image ( or qemu too ) and copy 'em over to tftpserver<br>=
&gt; &gt; ( /tftpboot/cuImage=5Fvishwa=5F1 and /tftpboot/initrd=5Fvishwa=5F=
1 )<br>&gt; &gt; 5/. reboot palmetto and run netboot to new image.<br>&gt; =
&gt; <br>&gt; &gt; I expected that the netman.py ( which is part of network=
.service ) and<br>&gt; &gt; netman=5Fwatch=5Fdns ( part of network-update-d=
ns.service ) would get auto<br>&gt; &gt; started but they did *not* start a=
nd I need some thoughts on why this may<br>&gt; &gt; be happening.<br>&gt; =
&gt; <br>&gt; &gt; <a href=3D"https://lists.yoctoproject.org/pipermail/yoct=
o/2015-April/024470.html">https://lists.yoctoproject.org/pipermail/yocto/20=
15-April/024470.html</a><br>&gt; &gt; ( Someone else also had same issue )<=
br>&gt; &gt; <br>&gt; &gt; What is that I am seeing :<br>&gt; &gt; <br>&gt;=
 &gt; 1/. I see these 2 files are actually inside /lib/systemd/system/netwo=
rk<br>&gt; &gt; Palmetto in as expected --&gt; Good<br>&gt; &gt; 2/. Servic=
es not started<br>&gt; &gt; 3/. systemctl status network shows that its dis=
abled. Same for update-dns.<br>&gt; &gt; 4/. I see systemctl status skeleto=
n displays everything is running<br>&gt; &gt; 4.1/ Removing the Requires=3D=
 and After=3D in network.service and booting to<br>&gt; &gt; that changed i=
mage still does not help.<br>&gt; &gt; 5/. Manual start using systemctl sta=
rt network -and/or- systemctl start<br>&gt; &gt; network-update-dns does ev=
erything okay and starts the expected services.<br>&gt; &gt; 6/. No error s=
een in journal<br>&gt; &gt; <br>&gt; &gt; Thanks<br>&gt; &gt; <br>&gt; &gt;=
 <br>&gt; -----------------------------------------------------------------=
--------------------<br>&gt; &gt; <br>&gt; &gt; Thanks and Regards,<br>&gt;=
 &gt; Vishwanath.<br>&gt; &gt; Advisory Software Engineer,<br>&gt; &gt; Pow=
er Firmware Development,<br>&gt; &gt; Systems &amp;Technology Lab,<br>&gt; =
&gt; MG2-6F-255 , Manyata Embassy Business Park,<br>&gt; &gt; Bangalore , K=
A , 560045<br>&gt; &gt; Ph: +91-80-46678255<br>&gt; &gt; E-mail: vishwanath=
@in.ibm.com<br>&gt; &gt; <br>&gt; -----------------------------------------=
-----------------------------------------<br>&gt; &gt; <br>&gt; <br>&gt; &g=
t; =5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F<br>&g=
t; &gt; openbmc mailing list<br>&gt; &gt; openbmc@lists.ozlabs.org<br>&gt; =
&gt; <a href=3D"https://lists.ozlabs.org/listinfo/openbmc">https://lists.oz=
labs.org/listinfo/openbmc</a><br>&gt; <br>&gt; <br>&gt; -- <br>&gt; Patrick=
 Williams<br>&gt; [attachment &quot;signature.asc&quot; deleted by Vishwana=
tha Subbanna/India/IBM] </tt><BR>
</body></html>

--0__=EABBF546DFAD64C28f9e8a93df938690918cEABBF546DFAD64C2--
