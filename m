Return-Path: <anoo@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rYtMN4cf8zDq5c
 for <openbmc@lists.ozlabs.org>; Wed, 22 Jun 2016 02:23:43 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.11/8.16.0.11) with SMTP id
 u5LGK5M1119688
 for <openbmc@lists.ozlabs.org>; Tue, 21 Jun 2016 12:23:41 -0400
Received: from e32.co.us.ibm.com (e32.co.us.ibm.com [32.97.110.150])
 by mx0b-001b2d01.pphosted.com with ESMTP id 23n0etwb6b-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 21 Jun 2016 12:23:40 -0400
Received: from localhost
 by e32.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <anoo@linux.vnet.ibm.com>;
 Tue, 21 Jun 2016 10:23:40 -0600
Received: from d03dlp02.boulder.ibm.com (9.17.202.178)
 by e32.co.us.ibm.com (192.168.1.132) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Tue, 21 Jun 2016 10:23:33 -0600
X-IBM-Helo: d03dlp02.boulder.ibm.com
X-IBM-MailFrom: anoo@linux.vnet.ibm.com
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by d03dlp02.boulder.ibm.com (Postfix) with ESMTP id D979E3E40030
 for <openbmc@lists.ozlabs.org>; Tue, 21 Jun 2016 10:23:32 -0600 (MDT)
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u5LGNWxE33423610
 for <openbmc@lists.ozlabs.org>; Tue, 21 Jun 2016 09:23:32 -0700
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9061090008
 for <openbmc@lists.ozlabs.org>; Tue, 21 Jun 2016 10:23:32 -0600 (MDT)
Received: from macbook-pro.austin.ibm.com (unknown [9.53.179.214])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTPS id 608B490004
 for <openbmc@lists.ozlabs.org>; Tue, 21 Jun 2016 10:23:32 -0600 (MDT)
From: Adriana Kobylak <anoo@linux.vnet.ibm.com>
Content-Type: multipart/alternative;
 boundary="Apple-Mail=_A1A7E928-41D6-4376-A4AB-DC020DD119BC"
Subject: Fwd: [openbmc/phosphor-host-ipmid] BMC version should be BCD encoded
 (#89)
Date: Tue, 21 Jun 2016 11:18:52 -0500
References: <openbmc/phosphor-host-ipmid/issues/89/227330539@github.com>
To: openbmc@lists.ozlabs.org
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Mailer: Apple Mail (2.3124)
X-TM-AS-GCONF: 00
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16062116-0004-0000-0000-00000FBCAC93
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 16062116-0005-0000-0000-0000765DD046
Message-Id: <E73A24ED-C82F-48F4-9F57-C70886A5E26F@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2016-06-21_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=3
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1604210000
 definitions=main-1606210184
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
X-List-Received-Date: Tue, 21 Jun 2016 16:23:45 -0000


--Apple-Mail=_A1A7E928-41D6-4376-A4AB-DC020DD119BC
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

Any thoughts on the concern about BMC version being decimal, so that the =
IPMI representation of the version in BCD does not match character by =
character the tag in github?
Should we limit the tag numbering to a max digit of 9 which would match =
the decimal and BCD representation, should the tag be in hex, or there =
should not be any change and this is how it works, other?


> Begin forwarded message:
>=20
> From: John Wang <notifications@github.com>
> Subject: Re: [openbmc/phosphor-host-ipmid] BMC version should be BCD =
encoded (#89)
> Date: June 20, 2016 at 10:20:47 PM CDT
> To: openbmc/phosphor-host-ipmid =
<phosphor-host-ipmid@noreply.github.com>
> Cc: Adriana Kobylak <anoo@linux.vnet.ibm.com>, State change =
<state_change@noreply.github.com>
> Reply-To: openbmc/phosphor-host-ipmid =
<reply+008a216f5c58e903296c17b81a4b7ad00c03eaed56ed5c7a92cf000000011380748=
f92a169ce0962da32@reply.github.com>
>=20
> It'll get confusion if the tag name is not the same as version in =
response data.
> For example that you mentioned above, the user/designer get the =
version 0.11 on a failure board and want to track the source code in the =
tag from GitHub. They won't find out 0.11 tag name in this case. The tag =
name on GitHub is 0.17 actually.
>=20
> =E2=80=94
> You are receiving this because you modified the open/close state.
> Reply to this email directly, view it on GitHub =
<https://github.com/openbmc/phosphor-host-ipmid/issues/89#issuecomment-227=
330539>, or mute the thread =
<https://github.com/notifications/unsubscribe/AIohb8z6mavEWUhhIWYbB4SfyfKF=
n7FGks5qN1iPgaJpZM4Ipq2v>.
>=20


--Apple-Mail=_A1A7E928-41D6-4376-A4AB-DC020DD119BC
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space;" =
class=3D"">Any thoughts on the concern about BMC version being decimal, =
so that the IPMI representation of the version in BCD does not match =
character by character the tag in github?<div class=3D"">Should we limit =
the tag numbering to a max digit of 9 which would match the decimal and =
BCD representation, should the tag be in hex, or there should not be any =
change and this is how it works, other?</div><div class=3D""><br =
class=3D""><div><br class=3D""><blockquote type=3D"cite" class=3D""><div =
class=3D"">Begin forwarded message:</div><br =
class=3D"Apple-interchange-newline"><div style=3D"margin-top: 0px; =
margin-right: 0px; margin-bottom: 0px; margin-left: 0px;" class=3D""><span=
 style=3D"font-family: -webkit-system-font, Helvetica Neue, Helvetica, =
sans-serif; color:rgba(0, 0, 0, 1.0);" class=3D""><b class=3D"">From: =
</b></span><span style=3D"font-family: -webkit-system-font, Helvetica =
Neue, Helvetica, sans-serif;" class=3D"">John Wang &lt;<a =
href=3D"mailto:notifications@github.com" =
class=3D"">notifications@github.com</a>&gt;<br =
class=3D""></span></div><div style=3D"margin-top: 0px; margin-right: =
0px; margin-bottom: 0px; margin-left: 0px;" class=3D""><span =
style=3D"font-family: -webkit-system-font, Helvetica Neue, Helvetica, =
sans-serif; color:rgba(0, 0, 0, 1.0);" class=3D""><b class=3D"">Subject: =
</b></span><span style=3D"font-family: -webkit-system-font, Helvetica =
Neue, Helvetica, sans-serif;" class=3D""><b class=3D"">Re: =
[openbmc/phosphor-host-ipmid] BMC version should be BCD encoded =
(#89)</b><br class=3D""></span></div><div style=3D"margin-top: 0px; =
margin-right: 0px; margin-bottom: 0px; margin-left: 0px;" class=3D""><span=
 style=3D"font-family: -webkit-system-font, Helvetica Neue, Helvetica, =
sans-serif; color:rgba(0, 0, 0, 1.0);" class=3D""><b class=3D"">Date: =
</b></span><span style=3D"font-family: -webkit-system-font, Helvetica =
Neue, Helvetica, sans-serif;" class=3D"">June 20, 2016 at 10:20:47 PM =
CDT<br class=3D""></span></div><div style=3D"margin-top: 0px; =
margin-right: 0px; margin-bottom: 0px; margin-left: 0px;" class=3D""><span=
 style=3D"font-family: -webkit-system-font, Helvetica Neue, Helvetica, =
sans-serif; color:rgba(0, 0, 0, 1.0);" class=3D""><b class=3D"">To: =
</b></span><span style=3D"font-family: -webkit-system-font, Helvetica =
Neue, Helvetica, sans-serif;" class=3D"">openbmc/phosphor-host-ipmid =
&lt;<a href=3D"mailto:phosphor-host-ipmid@noreply.github.com" =
class=3D"">phosphor-host-ipmid@noreply.github.com</a>&gt;<br =
class=3D""></span></div><div style=3D"margin-top: 0px; margin-right: =
0px; margin-bottom: 0px; margin-left: 0px;" class=3D""><span =
style=3D"font-family: -webkit-system-font, Helvetica Neue, Helvetica, =
sans-serif; color:rgba(0, 0, 0, 1.0);" class=3D""><b class=3D"">Cc: =
</b></span><span style=3D"font-family: -webkit-system-font, Helvetica =
Neue, Helvetica, sans-serif;" class=3D"">Adriana Kobylak &lt;<a =
href=3D"mailto:anoo@linux.vnet.ibm.com" =
class=3D"">anoo@linux.vnet.ibm.com</a>&gt;,        State change &lt;<a =
href=3D"mailto:state_change@noreply.github.com" =
class=3D"">state_change@noreply.github.com</a>&gt;<br =
class=3D""></span></div><div style=3D"margin-top: 0px; margin-right: =
0px; margin-bottom: 0px; margin-left: 0px;" class=3D""><span =
style=3D"font-family: -webkit-system-font, Helvetica Neue, Helvetica, =
sans-serif; color:rgba(0, 0, 0, 1.0);" class=3D""><b class=3D"">Reply-To: =
</b></span><span style=3D"font-family: -webkit-system-font, Helvetica =
Neue, Helvetica, sans-serif;" class=3D"">openbmc/phosphor-host-ipmid =
&lt;<a =
href=3D"mailto:reply+008a216f5c58e903296c17b81a4b7ad00c03eaed56ed5c7a92cf0=
00000011380748f92a169ce0962da32@reply.github.com" =
class=3D"">reply+008a216f5c58e903296c17b81a4b7ad00c03eaed56ed5c7a92cf00000=
0011380748f92a169ce0962da32@reply.github.com</a>&gt;<br =
class=3D""></span></div><br class=3D""><div class=3D""><p class=3D"">It'll=
 get confusion if the tag name is not the same as version in response =
data.<br class=3D"">
For example that you mentioned above, the user/designer get the version =
0.11 on a failure board and want to track the source code in the tag =
from GitHub. They won't find out 0.11 tag name in this case. The tag =
name on GitHub is 0.17 actually.</p><p =
style=3D"font-size:small;-webkit-text-size-adjust:none;color:#666;" =
class=3D"">=E2=80=94<br class=3D"">You are receiving this because you =
modified the open/close state.<br class=3D"">Reply to this email =
directly, <a =
href=3D"https://github.com/openbmc/phosphor-host-ipmid/issues/89#issuecomm=
ent-227330539" class=3D"">view it on GitHub</a>, or <a =
href=3D"https://github.com/notifications/unsubscribe/AIohb8z6mavEWUhhIWYbB=
4SfyfKFn7FGks5qN1iPgaJpZM4Ipq2v" class=3D"">mute the thread</a>.<img =
alt=3D"" height=3D"1" =
src=3D"https://github.com/notifications/beacon/AIohb5EnMYJ81fqf_wP6qWlRZ2c=
1WQ5Iks5qN1iPgaJpZM4Ipq2v.gif" width=3D"1" class=3D""></p>
<div itemscope=3D"" itemtype=3D"http://schema.org/EmailMessage" =
class=3D"">
<div itemprop=3D"action" itemscope=3D"" =
itemtype=3D"http://schema.org/ViewAction" class=3D"">
  <link itemprop=3D"url" =
href=3D"https://github.com/openbmc/phosphor-host-ipmid/issues/89#issuecomm=
ent-227330539" class=3D"">
  <meta itemprop=3D"name" content=3D"View Issue" class=3D"">
</div>
<meta itemprop=3D"description" content=3D"View this Issue on GitHub" =
class=3D"">
</div>
</div></blockquote></div><br class=3D""></div></body></html>=

--Apple-Mail=_A1A7E928-41D6-4376-A4AB-DC020DD119BC--
