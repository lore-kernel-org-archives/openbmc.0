Return-Path: <prkatti1@in.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=in.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=prkatti1@in.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=in.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 445cNH6fNJzDqWt
 for <openbmc@lists.ozlabs.org>; Sat, 23 Feb 2019 03:33:35 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x1MGVLQT019354
 for <openbmc@lists.ozlabs.org>; Fri, 22 Feb 2019 11:33:33 -0500
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.81])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2qtkbjdn77-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 22 Feb 2019 11:33:33 -0500
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <prkatti1@in.ibm.com>;
 Fri, 22 Feb 2019 16:33:32 -0000
Received: from us1a3-smtp08.a3.dal06.isc4sb.com (10.146.103.57)
 by smtp.notes.na.collabserv.com (10.106.227.88) with
 smtp.notes.na.collabserv.com ESMTP; Fri, 22 Feb 2019 16:33:29 -0000
Received: from us1a3-mail267.a3.dal06.isc4sb.com ([10.146.127.216])
 by us1a3-smtp08.a3.dal06.isc4sb.com
 with ESMTP id 2019022216332751-626768 ;
 Fri, 22 Feb 2019 16:33:27 +0000 
In-Reply-To: <OF53FC2776.6CFC8561-ON002583A9.00391CD8-652583A9.003ABCA8@LocalDomain>
To: openbmc@lists.ozlabs.org
Cc: "George Keishing" <gkeishin@in.ibm.com>
Subject: Redfish: Network test findings
From: "Prashanth Katti1" <prkatti1@in.ibm.com>
Date: Fri, 22 Feb 2019 22:03:27 +0530
References: <OF53FC2776.6CFC8561-ON002583A9.00391CD8-652583A9.003ABCA8@LocalDomain>
MIME-Version: 1.0
X-KeepSent: 3C14C139:B5348C62-002583A9:00475679;
 type=4; name=$KeepSent
X-Mailer: IBM Notes Release 9.0.1FP9 SHF55 October 04, 2017
X-LLNOutbound: False
X-Disclaimed: 49447
X-TNEFEvaluated: 1
x-cbid: 19022216-7093-0000-0000-00000A40DABB
X-IBM-SpamModules-Scores: BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.423878; ST=0; TS=0; UL=0; ISC=; MB=0.000000
X-IBM-SpamModules-Versions: BY=3.00010644; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000281; SDB=6.01164805; UDB=6.00608301; IPR=6.00945393; 
 BA=6.00006238; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00025699; XFM=3.00000015;
 UTC=2019-02-22 16:33:30
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2019-02-22 14:39:19 - 6.00009617
x-cbparentid: 19022216-7094-0000-0000-000070D408E4
Message-Id: <OF3C14C139.B5348C62-ON002583A9.00475679-652583A9.005AF2E2@notes.na.collabserv.com>
Content-Type: multipart/alternative;
 boundary="=_alternative 00476743652583A9_="
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-02-22_12:, , signatures=0
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
X-List-Received-Date: Fri, 22 Feb 2019 16:33:36 -0000


--=_alternative 00476743652583A9_=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="US-ASCII"

Hi Ed Tanous,

Here are the finding on Network test for bmcweb.
.=20
Could you look into the following issues and let us know.

 Configure IP address           =20
https://github.com/openbmc/bmcweb/issues/36
 Delete IP address              =20
https://github.com/openbmc/bmcweb/issues/36
 Configure DNS                  =20
https://github.com/openbmc/bmcweb/issues/50
 Configure NTP                                 =20
https://github.com/openbmc/bmcweb/issues/53
 Configure VLAN                =20
https://github.com/openbmc/bmcweb/issues/51
 Delete VLAN                                   =20
https://github.com/openbmc/bmcweb/issues/51
 Configure DHCP(Enable/Disable) =20
https://github.com/openbmc/bmcweb/issues/52
 Configure DHCP options                =20
https://github.com/openbmc/bmcweb/issues/52
 Configure HostName             =20
https://github.com/openbmc/bmcweb/issues/44
 Configure Default Gataeway     =20
https://github.com/openbmc/bmcweb/issues/54
 Configure MAC Address                      =20
https://github.com/openbmc/bmcweb/issues/43


Prashanth Katti


--=_alternative 00476743652583A9_=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset="US-ASCII"

<span style=3D" font-size:10pt;font-family:sans-serif">Hi Ed Tanous,</span>=
<br><br><span style=3D" font-size:10pt;font-family:sans-serif">Here are the=
 finding
on Network test for bmcweb.</span><br><span style=3D" font-size:10pt;font-f=
amily:sans-serif">. </span><br><span style=3D" font-size:10pt;font-family:s=
ans-serif">Could you look
into the following issues and let us know.</span><br><br><span style=3D" fo=
nt-size:10pt;font-family:sans-serif">&nbsp;Configure
IP address &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</span><a=
 href=3Dhttps://github.com/openbmc/bmcweb/issues/36><span style=3D" font-si=
ze:10pt;color:blue;font-family:sans-serif">&nbsp; &nbsp; &nbsp; &nbsp;https=
://github.com/openbmc/bmcweb/issues/36</span></a><br><span style=3D" font-s=
ize:10pt;font-family:sans-serif">&nbsp;Delete IP
address &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</span><a hr=
ef=3Dhttps://github.com/openbmc/bmcweb/issues/36><span style=3D" font-size:=
10pt;color:blue;font-family:sans-serif">&nbsp; &nbsp; &nbsp; &nbsp;https://=
github.com/openbmc/bmcweb/issues/36</span></a><br><span style=3D" font-size=
:10pt;font-family:sans-serif">&nbsp;Configure
DNS &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp;</span><a href=3Dhttps://github.com/openbmc/bmcw=
eb/issues/50><span style=3D" font-size:10pt;color:blue;font-family:sans-ser=
if">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;https://github.c=
om/openbmc/bmcweb/issues/50</span></a><br><span style=3D" font-size:10pt;fo=
nt-family:sans-serif">&nbsp;Configure
NTP &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp;</span><a href=3Dhttps://github.com/openbmc/bmcweb/issu=
es/53><span style=3D" font-size:10pt;color:blue;font-family:sans-serif">htt=
ps://github.com/openbmc/bmcweb/issues/53</span></a><br><span style=3D" font=
-size:10pt;font-family:sans-serif">&nbsp;Configure
VLAN &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp;</span><a href=3Dhttps://github.com/openbmc/bmcw=
eb/issues/51><span style=3D" font-size:10pt;color:blue;font-family:sans-ser=
if">https://github.com/openbmc/bmcweb/issues/51</span></a><br><span style=
=3D" font-size:10pt;font-family:sans-serif">&nbsp;Delete VLAN
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp;</span><a href=3Dhttps://github.com/openbmc/bmcweb/issues/51><=
span style=3D" font-size:10pt;color:blue;font-family:sans-serif">https://gi=
thub.com/openbmc/bmcweb/issues/51</span></a><br><span style=3D" font-size:1=
0pt;font-family:sans-serif">&nbsp;Configure
DHCP(Enable/Disable) </span><a href=3Dhttps://github.com/openbmc/bmcweb/iss=
ues/52><span style=3D" font-size:10pt;color:blue;font-family:sans-serif">&n=
bsp;
&nbsp;https://github.com/openbmc/bmcweb/issues/52</span></a><br><span style=
=3D" font-size:10pt;font-family:sans-serif">&nbsp;Configure
DHCP options &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
</span><a href=3Dhttps://github.com/openbmc/bmcweb/issues/52><span style=3D=
" font-size:10pt;color:blue;font-family:sans-serif">https://github.com/open=
bmc/bmcweb/issues/52</span></a><br><span style=3D" font-size:10pt;font-fami=
ly:sans-serif">&nbsp;Configure
HostName &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</span><a h=
ref=3Dhttps://github.com/openbmc/bmcweb/issues/44><span style=3D" font-size=
:10pt;color:blue;font-family:sans-serif">&nbsp; &nbsp; &nbsp; &nbsp;https:/=
/github.com/openbmc/bmcweb/issues/44</span></a><br><span style=3D" font-siz=
e:10pt;font-family:sans-serif">&nbsp;Configure
Default Gataeway &nbsp; &nbsp; &nbsp; &nbsp;</span><a href=3Dhttps://github=
.com/openbmc/bmcweb/issues/54><span style=3D" font-size:10pt;color:blue;fon=
t-family:sans-serif">&nbsp; &nbsp; &nbsp; &nbsp;https://github.com/openbmc/=
bmcweb/issues/54</span></a><br><span style=3D" font-size:10pt;font-family:s=
ans-serif">&nbsp;Configure
MAC Address &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; </span><a href=3Dhttps://github.com/openbmc/bmcweb/issues/43>=
<span style=3D" font-size:10pt;color:blue;font-family:sans-serif">https://g=
ithub.com/openbmc/bmcweb/issues/43</span></a><br><br><br><span style=3D" fo=
nt-size:10pt;font-family:sans-serif">Prashanth Katti</span><BR>
--=_alternative 00476743652583A9_=--
