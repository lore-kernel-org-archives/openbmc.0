Return-Path: <joseph-reynolds@charter.net>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=charter.net
 (client-ip=68.114.190.31; helo=mtaout006-public.msg.strl.va.charter.net;
 envelope-from=joseph-reynolds@charter.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=charter.net
Received: from mtaout006-public.msg.strl.va.charter.net
 (mtaout006-public.msg.strl.va.charter.net [68.114.190.31])
 by lists.ozlabs.org (Postfix) with ESMTP id 42FpYz4zYQzF31R
 for <openbmc@lists.ozlabs.org>; Thu, 20 Sep 2018 04:39:50 +1000 (AEST)
Received: from impout001 ([68.114.189.16]) by mtaout006.msg.strl.va.charter.net
 (InterMail vM.9.00.023.01 201-2473-194) with ESMTP
 id <20180919183948.KFXK7358.mtaout006.msg.strl.va.charter.net@impout001>;
 Wed, 19 Sep 2018 13:39:48 -0500
Received: from localhost ([68.114.5.89]) by impout001 with charter.net
 id dWfo1y00E1vEVCc01Wfoa0; Wed, 19 Sep 2018 13:39:48 -0500
X-Authority-Analysis: v=2.2 cv=ffHd8wYF c=1 sm=1 tr=0
 a=Yavjt5da9d9+LttJ/1I2fw==:117 a=Yavjt5da9d9+LttJ/1I2fw==:17
 a=fhUH8eI6RbIA:10 a=x7bEGLp0ZPQA:10 a=hOpmn2quAAAA:8 a=VnNF1IyMAAAA:8
 a=voM4FWlXAAAA:8 a=NEAV23lmAAAA:8 a=u2v1R8xNAJ0K_EObXccA:9 a=QEXdDO2ut3YA:10
 a=pGLkceISAAAA:8 a=1XWaLZrsAAAA:8 a=tcme9c7lAAAA:8 a=5xmKGbJMoeZjFY_SFPoA:9
 a=Wm1Qa0KMMYxGIo4N:21 a=_W_S_7VecoQA:10 a=GyA-uvUxXSCciAkwuKQO:22
 a=IC2XNlieTeVoXbcui8wp:22 a=cJsI3S3cdgERF2JXxJch:22
Message-ID: <dWfo1y00E1vEVCc01Wfoa0@charter.net>
From: joseph-reynolds@charter.net
To: "'Andrew Geissler'" <geissonator@gmail.com>
Cc: "'OpenBMC Maillist'" <openbmc@lists.ozlabs.org>,
 "'Patrick Venture'" <venture@google.com>
X-Mailer: Atmail 7.1.1.13434
X-Originating-IP: [129.42.161.35]
Subject: Documenting hardware support (was: Repository Growth)
Date: Wed, 19 Sep 2018 13:39:48 -0500
Content-Type: multipart/alternative;
 boundary="=_240a7f2159010029e60fb9d1f0745805"
MIME-Version: 1.0
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
X-List-Received-Date: Wed, 19 Sep 2018 18:39:52 -0000

--=_240a7f2159010029e60fb9d1f0745805
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

I apologize in advance if this is not formatted as plain text and for=0A=
"top posting"... I'll try to improve my email etiquette.=0A=0AIdea: Expl=
ain OpenBMC hardware environments=0AI would like to see a brief explanat=
ion of OpenBMC's relationship to=0Aits BMC and host server. In my (limit=
ed) understanding, the=0Arelationship between the two hardware platforms=
 (how the BMC services=0Aits host) is the essence of what OpenBMC adds t=
o the openembedded=0Aproject, so it deserves an explanation in the docs=
 repo.=0A=0ASpecifically, this is required background to discuss OpenBMC=
 support=0Afor various BMCs and host machines. - I understand BMC hardwa=
re=0Asupport is in the form of Board Support Packages (BSP) which come f=
rom=0Athe openembedded project.=0A - I understand host machines are supp=
orted from meta-layers.=0A=0AI propose to enhance the openbmc/docs docs=
 to include talk about how=0Ato find board support layers (e.g., meta-as=
peed), and machine layers=0A(e.g., meta-intel). For each supported BMC a=
nd each supported host, I=0Awant to understand:=0A - where to find more=
 information about the device (e.g., its proper=0Aname, manufacturer or=
 specs)=0A - how OpenBMC supports that hardware. Example: OpenPower syst=
ems use=0Athe meta-openpower layer and various openpower-* layers such a=
s=0Aopenpower-power-control.=0A=0AI have a limited hardware background,=
 but I presume such a document=0Awould be a good place to introduce any=
 hardware-facing features that=0ABMCs typically provide (i.e., added to=
 the openembedded layer). For=0Aexample:=0A - firmware update=0A - event=
 log processing=0A - host console or video=0A=0AAlso, I believe such a d=
ocument would be a good place to anchor the=0Aguide for how to add a new=
 BMC or host machine.=0A=0A=09-----------------------------------------F=
rom: "Andrew Geissler" =0ATo: joseph-reynolds@charter.net=0ACc: "OpenBMC=
 Maillist", "Patrick Venture"=0ASent: Wednesday September 19 2018 1:09:5=
2PM=0ASubject: Re: Repository Growth=0A=0A On Wed, Sep 19, 2018 at 12:56=
 PM  wrote:=0A >=0A >=0A > Date: Wed, 19 Sep 2018 09:42:16 -0700=0A > Fr=
om: Patrick Venture =0A > To: anoo@linux.ibm.com=0A > Cc: OpenBMC Mailli=
st , Brad Bishop=0A > , Nancy Yuen ,=0A > openbmc-bounces+anoo=3Dlinux.i=
bm.com@lists.ozlabs.org=0A > Subject: Re: Repository Growth=0A > Message=
-ID:=0A > =0A > Content-Type: text/plain; charset=3D"UTF-8"=0A >=0A > On=
 Wed, Sep 19, 2018 at 9:03 AM Adriana Kobylak  wrote:=0A > >=0A > > On 2=
018-09-19 10:47, Patrick Venture wrote:=0A > > > With the growth of numb=
er of repositories, it might be=0Aoverwhelming to=0A > > > someone who w=
ants to set things up.=0A > > >=0A > > > I'd like to write up a director=
y that groups the repositories=0Aby=0A > > > purpose. I wasn't sure if t=
his made sense, so I wanted early=0Afeedback=0A > > > before I started.=
 The maintenance of it would be horrible for=0Aone=0A > > > person, but=
 if someone wants their repository to have details=0Aand so=0A > > > on=
 they can add it.=0A > > >=0A > > > I think it's important or useful to=
 know what's out there and=0Ahow=0A > > > things work together or don't,=
 and what options there are for=0A > > > developers.=0A > > >=0A > >=0A=
 > > +1 . Do you have a template in mind on how this could look like?=0A=
 >=0A > I've been toying around with some ideas on how to organize the=
=0A > information. Grouping the subtrees together is a no-brainer, but=
=0Amany=0A > daemons don't really fit into a category. Maybe that's fine=
, maybe=0A > then it'd be uncategorized.=0A >=0A > I was imagining:=0A >=
=0A > {repository name}=0A > {short description}=0A > works with: {list=
 of related pieces}=0A >=0A > for instance:=0A > """=0A > ### phosphor-h=
wmon=0A > phosphor-hwmon periodically reads and reports hwmon sensor val=
ues=0Ato dbus.=0A > works with: phosphor-host-ipmid=0A > """=0A >=0A > Y=
ou don't need to run phosphor-host-ipmid to use phosphor-hwmon,=0Aand=0A=
 > phosphor-pid-control and other daemons can also listen to sensor=0A >=
 values or read them over dbus, so I don't know how complete such a=0A >=
 list would need to be. So maybe the list should be less explicit. I=0A=
 > realize that the recipes themselves reveal the true dependencies,=0A=
 > either virtual or specific and I don't want to repost information.=0A=
I=0A > just want to present a better interface to the set of repositorie=
s=0Aand=0A > how they work together (or don't) than github has.=0A >=0A=
 > >=0A > > > Thoughts?=0A >=0A > I had the same idea from reading throu=
gh the presentations recently=0Alinked to on this mailing list.=0A >=0A=
 > OpenBMC lists its features on its front page=0A(https://github.com/op=
enbmc/openbmc [1] README) and suggests there is=0Amore information in ht=
tps://github.com/openbmc/docs. [2] However, the=0Ainformation is not str=
uctured as well as it could be for someone to=0Alearn about each feature=
. I propose to list each feature along with=0Athe following information=
 (as applicable):=0A > - reference an external website or standard=0A >=
 - categorize: host-facing, management network facing, application=0A >=
 - explain terminology (give synonyms)=0A > - explain 1 or 2 use cases=
=0A > - link to the docs (which should explain customizations)=0A > - li=
nk to the source code repo=0A >=0A > I would start with the features lis=
ted in openbmc/README, and add=0Afeatures (or interfaces?) from James's=
 presentation:=0A > - Host interfaces: KCS, BT, mbox, IPMB, USB, VGA=0A=
 > - Network Interfaces: Redfish, https, ssh, rmcp+=0A > - Applications:=
 EWS, KVM, IPMI, FSC, SEL, SOL, Chassis Control,=0AASD, Firmware Update,=
 Configuration Manager, Sensor Monitor=0A=0A Makes sense to me.=0A=0A Pe=
r the mailing list discussion yesterday on the hackathon, I'm also=0A st=
arting to work on some "digging into openbmc coding" type docs.=0A That=
 will probably deserve it's own directory?=0A - Getting Started: Dev env=
 setup, hello world via SDK/QEMU, adding a=0A new system/layer, customiz=
ing webui and other items for new system,=0A bitbake using local repos,=
 ...=0A=0A >=0A > So, the proposal is to group repos by feature and inte=
rface.=0A >=0A > > >=0A > > > Patrick=0A > >=0A >=0A =0A=0ALinks:=0A----=
--=0A[1] https://github.com/openbmc/openbmc=0A[2] https://github.com/ope=
nbmc/docs.=0A

--=_240a7f2159010029e60fb9d1f0745805
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html><body><div>I apologize in advance if this is not formatted as plai=
n text and for "top posting"... I'll try to improve my email etiquette.<=
br></div><div><br></div><div>Idea: Explain OpenBMC hardware environments=
</div><div><br></div><div>I would like to see a brief explanation of Ope=
nBMC's relationship to its BMC and host server.&nbsp; In my (limited) un=
derstanding, the relationship between the two hardware platforms (how th=
e BMC services its host) is the essence of what OpenBMC adds to the open=
embedded project, so it deserves an explanation in the docs repo.<br><br=
>Specifically, this is required background to discuss OpenBMC support fo=
r various BMCs and host machines.</div><div>&nbsp;- I understand BMC har=
dware support is in the form of Board Support Packages (BSP) which come=
 from the openembedded project.<br>&nbsp;- I understand host machines ar=
e supported from meta-layers.<br><br>I propose to enhance the openbmc/do=
cs docs to include talk about how to find board support layers (e.g., me=
ta-aspeed), and machine layers (e.g., meta-intel).&nbsp; For each suppor=
ted BMC and each supported host, I want to understand:<br>&nbsp;- where=
 to find more information about the device (e.g., its proper name, manuf=
acturer or specs)<br>&nbsp;- how OpenBMC supports that hardware.&nbsp; E=
xample: OpenPower systems use the meta-openpower layer and various openp=
ower-* layers such as openpower-power-control.<br><br>I have a limited h=
ardware background, but I presume such a document would be a good place=
 to introduce any hardware-facing features that BMCs typically provide (=
i.e., added to the openembedded layer).&nbsp; For example:<br>&nbsp;- fi=
rmware update<br>&nbsp;- event log processing<br>&nbsp;- host console or=
 video<br><br>Also, I believe such a document would be a good place to a=
nchor the guide for how to add a new BMC or host machine.<br><br></div><=
br><div class=3D"reply-new-signature"></div><p>-------------------------=
----------------</p>From: "Andrew Geissler" <geissonator@gmail.com><br>T=
o: joseph-reynolds@charter.net<br>Cc: "OpenBMC Maillist", "Patrick Ventu=
re"<br>Sent: Wednesday September 19 2018 1:09:52PM<br>Subject: Re: Repos=
itory Growth<br><br> On Wed, Sep 19, 2018 at 12:56 PM &lt;joseph-reynold=
s@charter.net&gt; wrote:<br>=0A &gt;<br>=0A &gt;<br>=0A &gt; Date: Wed,=
 19 Sep 2018 09:42:16 -0700<br>=0A &gt; From: Patrick Venture &lt;ventur=
e@google.com&gt;<br>=0A &gt; To: anoo@linux.ibm.com<br>=0A &gt; Cc: Open=
BMC Maillist &lt;openbmc@lists.ozlabs.org&gt;, Brad Bishop<br>=0A &gt; &=
lt;bradleyb@fuzziesquirrel.com&gt;, Nancy Yuen &lt;yuenn@google.com&gt;,=
<br>=0A &gt; openbmc-bounces+anoo=3Dlinux.ibm.com@lists.ozlabs.org<br>=
=0A &gt; Subject: Re: Repository Growth<br>=0A &gt; Message-ID:<br>=0A &=
gt; &lt;CAO=3DnotwvBca4ANU6b-kQggP53cM2CdsCVV5QqsBYUCJ_jB+Xkg@mail.gmail=
.com&gt;<br>=0A &gt; Content-Type: text/plain; charset=3D"UTF-8"<br>=0A=
 &gt;<br>=0A &gt; On Wed, Sep 19, 2018 at 9:03 AM Adriana Kobylak &lt;an=
oo@linux.ibm.com&gt; wrote:<br>=0A &gt; &gt;<br>=0A &gt; &gt; On 2018-09=
-19 10:47, Patrick Venture wrote:<br>=0A &gt; &gt; &gt; With the growth=
 of number of repositories, it might be overwhelming to<br>=0A &gt; &gt;=
 &gt; someone who wants to set things up.<br>=0A &gt; &gt; &gt;<br>=0A &=
gt; &gt; &gt; I'd like to write up a directory that groups the repositor=
ies by<br>=0A &gt; &gt; &gt; purpose. I wasn't sure if this made sense,=
 so I wanted early feedback<br>=0A &gt; &gt; &gt; before I started. The=
 maintenance of it would be horrible for one<br>=0A &gt; &gt; &gt; perso=
n, but if someone wants their repository to have details and so<br>=0A &=
gt; &gt; &gt; on they can add it.<br>=0A &gt; &gt; &gt;<br>=0A &gt; &gt;=
 &gt; I think it's important or useful to know what's out there and how<=
br>=0A &gt; &gt; &gt; things work together or don't, and what options th=
ere are for<br>=0A &gt; &gt; &gt; developers.<br>=0A &gt; &gt; &gt;<br>=
=0A &gt; &gt;<br>=0A &gt; &gt; +1 . Do you have a template in mind on ho=
w this could look like?<br>=0A &gt;<br>=0A &gt; I've been toying around=
 with some ideas on how to organize the<br>=0A &gt; information. Groupin=
g the subtrees together is a no-brainer, but many<br>=0A &gt; daemons do=
n't really fit into a category. Maybe that's fine, maybe<br>=0A &gt; the=
n it'd be uncategorized.<br>=0A &gt;<br>=0A &gt; I was imagining:<br>=0A=
 &gt;<br>=0A &gt; {repository name}<br>=0A &gt; {short description}<br>=
=0A &gt; works with: {list of related pieces}<br>=0A &gt;<br>=0A &gt; fo=
r instance:<br>=0A &gt; """<br>=0A &gt; ### phosphor-hwmon<br>=0A &gt; p=
hosphor-hwmon periodically reads and reports hwmon sensor values to dbus=
.<br>=0A &gt; works with: phosphor-host-ipmid<br>=0A &gt; """<br>=0A &gt=
;<br>=0A &gt; You don't need to run phosphor-host-ipmid to use phosphor-=
hwmon, and<br>=0A &gt; phosphor-pid-control and other daemons can also l=
isten to sensor<br>=0A &gt; values or read them over dbus, so I don't kn=
ow how complete such a<br>=0A &gt; list would need to be. So maybe the l=
ist should be less explicit. I<br>=0A &gt; realize that the recipes them=
selves reveal the true dependencies,<br>=0A &gt; either virtual or speci=
fic and I don't want to repost information. I<br>=0A &gt; just want to p=
resent a better interface to the set of repositories and<br>=0A &gt; how=
 they work together (or don't) than github has.<br>=0A &gt;<br>=0A &gt;=
 &gt;<br>=0A &gt; &gt; &gt; Thoughts?<br>=0A &gt;<br>=0A &gt; I had the=
 same idea from reading through the presentations recently linked to on=
 this mailing list.<br>=0A &gt;<br>=0A &gt; OpenBMC lists its features o=
n its front page (<a target=3D"_blank" href=3D"https://github.com/openbm=
c/openbmc">https://github.com/openbmc/openbmc</a> README) and suggests t=
here is more information in <a target=3D"_blank" href=3D"https://github.=
com/openbmc/docs.">https://github.com/openbmc/docs.</a> However, the inf=
ormation is not structured as well as it could be for someone to learn a=
bout each feature. I propose to list each feature along with the followi=
ng information (as applicable):<br>=0A &gt; - reference an external webs=
ite or standard<br>=0A &gt; - categorize: host-facing, management networ=
k facing, application<br>=0A &gt; - explain terminology (give synonyms)<=
br>=0A &gt; - explain 1 or 2 use cases<br>=0A &gt; - link to the docs (w=
hich should explain customizations)<br>=0A &gt; - link to the source cod=
e repo<br>=0A &gt;<br>=0A &gt; I would start with the features listed in=
 openbmc/README, and add features (or interfaces?) from James's presenta=
tion:<br>=0A &gt; - Host interfaces: KCS, BT, mbox, IPMB, USB, VGA<br>=
=0A &gt; - Network Interfaces: Redfish, https, ssh, rmcp+<br>=0A &gt; -=
 Applications: EWS, KVM, IPMI, FSC, SEL, SOL, Chassis Control, ASD, Firm=
ware Update, Configuration Manager, Sensor Monitor<br>=0A <br>=0A Makes=
 sense to me.<br>=0A <br>=0A Per the mailing list discussion yesterday o=
n the hackathon, I'm also<br>=0A starting to work on some "digging into=
 openbmc coding" type docs.<br>=0A That will probably deserve it's own d=
irectory?<br>=0A - Getting Started: Dev env setup, hello world via SDK/Q=
EMU, adding a<br>=0A new system/layer, customizing webui and other items=
 for new system,<br>=0A bitbake using local repos, ...<br>=0A <br>=0A &g=
t;<br>=0A &gt; So, the proposal is to group repos by feature and interfa=
ce.<br>=0A &gt;<br>=0A &gt; &gt; &gt;<br>=0A &gt; &gt; &gt; Patrick<br>=
=0A &gt; &gt;<br>=0A &gt;<br>=0A </geissonator@gmail.com></body></html>

--=_240a7f2159010029e60fb9d1f0745805--
