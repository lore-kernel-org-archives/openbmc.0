Return-Path: <joseph-reynolds@charter.net>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=charter.net
 (client-ip=68.114.190.28; helo=mtaout003-public.msg.strl.va.charter.net;
 envelope-from=joseph-reynolds@charter.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=charter.net
Received: from mtaout003-public.msg.strl.va.charter.net
 (mtaout003-public.msg.strl.va.charter.net [68.114.190.28])
 by lists.ozlabs.org (Postfix) with ESMTP id 42Fnbq6tmkzDrq6
 for <openbmc@lists.ozlabs.org>; Thu, 20 Sep 2018 03:56:22 +1000 (AEST)
Received: from impout005 ([68.114.189.20]) by mtaout003.msg.strl.va.charter.net
 (InterMail vM.9.00.023.01 201-2473-194) with ESMTP
 id <20180919175619.PCPZ7355.mtaout003.msg.strl.va.charter.net@impout005>;
 Wed, 19 Sep 2018 12:56:19 -0500
Received: from localhost ([68.114.5.89]) by impout005 with charter.net
 id dVwK1y00D1vEVCc01VwKs6; Wed, 19 Sep 2018 12:56:19 -0500
X-Authority-Analysis: v=2.2 cv=Ts+WvHfh c=1 sm=1 tr=0
 a=TCoy8643828aVrQ/xkChTA==:117 a=TCoy8643828aVrQ/xkChTA==:17
 a=PDJVsj41jioA:10 a=x7bEGLp0ZPQA:10 a=NEAV23lmAAAA:8 a=FMVizwhwqYwY9B8NgGEA:9
 a=QEXdDO2ut3YA:10 a=voM4FWlXAAAA:8 a=1XWaLZrsAAAA:8 a=VnNF1IyMAAAA:8
 a=tcme9c7lAAAA:8 a=pGLkceISAAAA:8 a=dpRSjrXKAAAA:8 a=cIUgufmclAkPnAmnvewA:9
 a=4pvKE7EWCKKJPsMk:21 a=_W_S_7VecoQA:10 a=-FEs8UIgK8oA:10 a=NWVoK91CQyQA:10
 a=IC2XNlieTeVoXbcui8wp:22 a=cJsI3S3cdgERF2JXxJch:22 a=xkwab4zIHtOjTkBAMNFX:22
Message-ID: <dVwK1y00D1vEVCc01VwKs6@charter.net>
From: joseph-reynolds@charter.net
To: "'openbmc@lists.ozlabs.org'" <openbmc@lists.ozlabs.org>,
 "'openbmc@lists.ozlabs.org'" <openbmc@lists.ozlabs.org>,
 "'venture@google.com'" <venture@google.com>
X-Mailer: Atmail 7.1.1.13434
X-Originating-IP: [76.224.89.166]
Subject: RE: Repository Growth
Date: Wed, 19 Sep 2018 12:56:19 -0500
Content-Type: multipart/alternative;
 boundary="=_478b34edf81fee4a062f51f50fa32e67"
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
X-List-Received-Date: Wed, 19 Sep 2018 17:56:25 -0000

--=_478b34edf81fee4a062f51f50fa32e67
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

 > Thoughts?=0AI had the same idea from reading through the presentation=
s recently=0Alinked to on this mailing list.=0A=0AOpenBMC lists its feat=
ures on its front page=0A(https://github.com/openbmc/openbmc README) and=
 suggests there is more=0Ainformation in https://github.com/openbmc/docs=
. However, the=0Ainformation is not structured as well as it could be fo=
r someone to=0Alearn about each feature. I propose to list each feature=
 along with=0Athe following information (as applicable):=0A - reference=
 an external website or standard=0A - categorize: host-facing, managemen=
t network facing, application=0A - explain terminology (give synonyms)=
=0A - explain 1 or 2 use cases=0A - link to the docs (which should expla=
in customizations)=0A - link to the source code repo=0A=0AI would start=
 with the features listed in openbmc/README, and add=0Afeatures (or inte=
rfaces?) from James's presentation:=0A - Host interfaces: KCS, BT, mbox,=
 IPMB, USB, VGA=0A - Network Interfaces: Redfish, https, ssh, rmcp+=0A -=
 Applications: EWS, KVM, IPMI, FSC, SEL, SOL, Chassis Control, ASD,=0AFi=
rmware Update, Configuration Manager, Sensor Monitor=0A=0ASo, the propos=
al is to group repos by feature and interface.=0A=0A

--=_478b34edf81fee4a062f51f50fa32e67
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html><body><a target=3D"_blank" href=3D"https://lists.ozlabs.org/listin=
fo/openbmc<br"><br>=0A Date: Wed, 19 Sep 2018 09:42:16 -0700<br>=0A From=
: Patrick Venture &lt;venture@google.com&gt;<br>=0A To: anoo@linux.ibm.c=
om<br>=0A Cc: OpenBMC Maillist &lt;openbmc@lists.ozlabs.org&gt;, Brad Bi=
shop<br>=0A &lt;bradleyb@fuzziesquirrel.com&gt;, Nancy Yuen &lt;yuenn@go=
ogle.com&gt;,<br>=0A openbmc-bounces+anoo=3Dlinux.ibm.com@lists.ozlabs.o=
rg<br>=0A Subject: Re: Repository Growth<br>=0A Message-ID:<br>=0A &lt;C=
AO=3DnotwvBca4ANU6b-kQggP53cM2CdsCVV5QqsBYUCJ_jB+Xkg@mail.gmail.com&gt;<=
br>=0A Content-Type: text/plain; charset=3D"UTF-8"<br>=0A <br>=0A On Wed=
, Sep 19, 2018 at 9:03 AM Adriana Kobylak &lt;anoo@linux.ibm.com&gt; wro=
te:<br>=0A &gt;<br>=0A &gt; On 2018-09-19 10:47, Patrick Venture wrote:<=
br>=0A &gt; &gt; With the growth of number of repositories, it might be=
 overwhelming to<br>=0A &gt; &gt; someone who wants to set things up.<br=
>=0A &gt; &gt;<br>=0A &gt; &gt; I'd like to write up a directory that gr=
oups the repositories by<br>=0A &gt; &gt; purpose. I wasn't sure if this=
 made sense, so I wanted early feedback<br>=0A &gt; &gt; before I starte=
d. The maintenance of it would be horrible for one<br>=0A &gt; &gt; pers=
on, but if someone wants their repository to have details and so<br>=0A=
 &gt; &gt; on they can add it.<br>=0A &gt; &gt;<br>=0A &gt; &gt; I think=
 it's important or useful to know what's out there and how<br>=0A &gt; &=
gt; things work together or don't, and what options there are for<br>=0A=
 &gt; &gt; developers.<br>=0A &gt; &gt;<br>=0A &gt;<br>=0A &gt; +1 . Do=
 you have a template in mind on how this could look like?<br>=0A <br>=0A=
 I've been toying around with some ideas on how to organize the<br>=0A i=
nformation. Grouping the subtrees together is a no-brainer, but many<br>=
=0A daemons don't really fit into a category. Maybe that's fine, maybe<b=
r>=0A then it'd be uncategorized.<br>=0A <br>=0A I was imagining:<br>=0A=
 <br>=0A {repository name}<br>=0A {short description}<br>=0A works with:=
 {list of related pieces}<br>=0A <br>=0A for instance:<br>=0A """<br>=0A=
 ### phosphor-hwmon<br>=0A phosphor-hwmon periodically reads and reports=
 hwmon sensor values to dbus.<br>=0A works with: phosphor-host-ipmid<br>=
=0A """<br>=0A <br>=0A You don't need to run phosphor-host-ipmid to use=
 phosphor-hwmon, and<br>=0A phosphor-pid-control and other daemons can a=
lso listen to sensor<br>=0A values or read them over dbus, so I don't kn=
ow how complete such a<br>=0A list would need to be. So maybe the list s=
hould be less explicit. I<br>=0A realize that the recipes themselves rev=
eal the true dependencies,<br>=0A either virtual or specific and I don't=
 want to repost information. I<br>=0A just want to present a better inte=
rface to the set of repositories and<br>=0A how they work together (or d=
on't) than github has.<br>=0A <br>=0A &gt;<br></a><div><a target=3D"_bla=
nk" href=3D"https://lists.ozlabs.org/listinfo/openbmc<br">=0A &gt; &gt;=
 Thoughts?</a></div><div><br></div><div>I had the same idea from reading=
 through the presentations recently linked to on this mailing list.<br><=
/div><div><br>OpenBMC lists its features on its front page (https://gith=
ub.com/openbmc/openbmc README) and suggests there is more information in=
 https://github.com/openbmc/docs.&nbsp; However, the information is not=
 structured as well as it could be for someone to learn about each featu=
re.&nbsp; I propose to list each feature along with the following inform=
ation (as applicable):<br>&nbsp;- reference an external website or stand=
ard<br>&nbsp;- categorize: host-facing, management network facing, appli=
cation<br>&nbsp;- explain terminology (give synonyms)<br>&nbsp;- explain=
 1 or 2 use cases<br>&nbsp;- link to the docs (which should explain cust=
omizations)<br>&nbsp;- link to the source code repo<br><br>I would start=
 with the features listed in openbmc/README, and add features (or interf=
aces?) from James's presentation:<br>&nbsp;- Host interfaces: KCS, BT, m=
box, IPMB, USB, VGA<br>&nbsp;- Network Interfaces: Redfish, https, ssh,=
 rmcp+<br>&nbsp;- Applications: EWS, KVM, IPMI, FSC, SEL, SOL, Chassis C=
ontrol, ASD, Firmware Update, Configuration Manager, Sensor Monitor<br><=
br>So, the proposal is to group repos by feature and interface.<br></div=
><div><br></div><a target=3D"_blank" href=3D"https://lists.ozlabs.org/li=
stinfo/openbmc<br">=0A &gt; &gt;<br>=0A &gt; &gt; Patrick<br>=0A &gt;<br=
>=0A </a><a target=3D"_blank" href=3D"https://gerrit.openbmc-project.xyz=
/#/q/project:openbmc/meta-x86<br"><br></a></body></html>

--=_478b34edf81fee4a062f51f50fa32e67--
