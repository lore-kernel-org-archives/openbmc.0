Return-Path: <austenc@us.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rqY5P0R5WzDqFd
 for <openbmc@lists.ozlabs.org>; Thu, 14 Jul 2016 08:14:00 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.11/8.16.0.11) with SMTP id
 u6DM9x4Z074542
 for <openbmc@lists.ozlabs.org>; Wed, 13 Jul 2016 18:13:56 -0400
Received: from e35.co.us.ibm.com (e35.co.us.ibm.com [32.97.110.153])
 by mx0a-001b2d01.pphosted.com with ESMTP id 24507cn764-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 13 Jul 2016 18:13:55 -0400
Received: from localhost
 by e35.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <austenc@us.ibm.com>;
 Wed, 13 Jul 2016 16:13:54 -0600
Received: from d03dlp03.boulder.ibm.com (9.17.202.179)
 by e35.co.us.ibm.com (192.168.1.135) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Wed, 13 Jul 2016 16:13:51 -0600
X-IBM-Helo: d03dlp03.boulder.ibm.com
X-IBM-MailFrom: austenc@us.ibm.com
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by d03dlp03.boulder.ibm.com (Postfix) with ESMTP id D583319D801C
 for <openbmc@lists.ozlabs.org>; Wed, 13 Jul 2016 16:13:27 -0600 (MDT)
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u6DMDpL145416612
 for <openbmc@lists.ozlabs.org>; Wed, 13 Jul 2016 15:13:51 -0700
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 56DC9C604A
 for <openbmc@lists.ozlabs.org>; Wed, 13 Jul 2016 16:13:51 -0600 (MDT)
Received: from d50lp33.co.us.ibm.com (unknown [9.17.249.38])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTPS id 3D18FC6047
 for <openbmc@lists.ozlabs.org>; Wed, 13 Jul 2016 16:13:51 -0600 (MDT)
Received: from localhost
 by d50lp33.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <austenc@us.ibm.com>;
 Wed, 13 Jul 2016 16:13:51 -0600
Received: from smtp.notes.na.collabserv.com (192.155.248.93)
 by d50lp33.co.us.ibm.com (192.168.2.144) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256/256)
 Wed, 13 Jul 2016 16:13:48 -0600
X-IBM-Helo: smtp.notes.na.collabserv.com
X-IBM-MailFrom: austenc@us.ibm.com
Received: from /spool/local
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <austenc@us.ibm.com>;
 Wed, 13 Jul 2016 22:13:46 -0000
Received: from us1a3-smtp02.a3.dal06.isc4sb.com (10.106.154.159)
 by smtp.notes.na.collabserv.com (10.106.227.39) with
 smtp.notes.na.collabserv.com ESMTP; Wed, 13 Jul 2016 22:13:43 -0000
Received: from us1a3-mail75.a3.dal09.isc4sb.com ([10.142.3.82])
 by us1a3-smtp02.a3.dal06.isc4sb.com
 with ESMTP id 2016071322134290-523619 ;
 Wed, 13 Jul 2016 22:13:42 +0000 
MIME-Version: 1.0
In-Reply-To: <57866FE0.3030300@fb.com>
Subject: Re: OpenBMC port to AST2400 on Piestewa Peak CRB?
To: Tian Fang <tfang@fb.com>
Cc: Patrick Williams <patrick@stwcx.xyz>,
 =?ISO-8859-1?Q?David_M=FCller?= (ELSOFT AG) <d.mueller@elsoft.ch>,
 openbmc@lists.ozlabs.org, Teddy Reed <teddy@prosauce.org>
From: "Chris Austen" <austenc@us.ibm.com>
Date: Wed, 13 Jul 2016 17:13:44 -0500
References: <57863637.3090405@elsoft.ch>
 <20160713162732.GB12735@asimov.austin.ibm.com>
 <57866FE0.3030300@fb.com>
X-KeepSent: 905AF09B:91F8D431-86257FEF:007A0E85;
 type=4; name=$KeepSent
X-Mailer: IBM Notes Release 9.0.1FP2 SHF37 August 25, 2014
X-LLNOutbound: False
X-Disclaimed: 18411
X-TNEFEvaluated: 1
Content-type: multipart/related; 
 Boundary="0__=09BBF57CDFE988158f9e8a93df938690918c09BBF57CDFE98815"
x-cbid: 16071322-0012-0000-0000-00001028A25D
X-IBM-ISS-SpamDetectors: Score=0.410717; BY=0.29404; FL=0; FP=0; FZ=0; HX=0;
 KW=0; PH=0; SC=0.410717; ST=0; TS=0; UL=0; ISC=
X-IBM-ISS-DetailInfo: BY=3.00005492; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000173; SDB=6.00729959; UDB=6.00341973; UTC=2016-07-13
 22:13:45
x-cbparentid: 16071322-3202-0000-0000-000001429793
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
X-TM-AS-GCONF: 00
X-Content-Scanned: Fidelis XPS MAILER
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
Message-Id: <OF905AF09B.91F8D431-ON86257FEF.007A0E85-86257FEF.007A1B87@notes.na.collabserv.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2016-07-13_12:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=3
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1604210000
 definitions=main-1607130244
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
X-List-Received-Date: Wed, 13 Jul 2016 22:14:01 -0000

--0__=09BBF57CDFE988158f9e8a93df938690918c09BBF57CDFE98815
Content-type: multipart/alternative; 
	Boundary="1__=09BBF57CDFE988158f9e8a93df938690918c09BBF57CDFE98815"


--1__=09BBF57CDFE988158f9e8a93df938690918c09BBF57CDFE98815
Content-Transfer-Encoding: quoted-printable
Content-type: text/plain; charset=ISO-8859-1


Hi David, is that something you would be interested in helping to develop?


Chris Austen
POWER Systems Enablement Manager
(512) 286-5184 (T/L: 363-5184)



From:	Tian Fang <tfang@fb.com>
To:	Patrick Williams <patrick@stwcx.xyz>, David M=FCller (ELSOFT AG)
            <d.mueller@elsoft.ch>
Cc:	openbmc@lists.ozlabs.org, Teddy Reed <teddy@prosauce.org>
Date:	07/13/2016 11:59 AM
Subject:	Re: OpenBMC port to AST2400 on Piestewa Peak CRB?
Sent by:	"openbmc" <openbmc-bounces+austenc=3Dus.ibm.com@lists.ozlabs.org>



Hi Dave,

Facebook has been developing OpenBMC for several Intel host CPU boards
using AST2400. But not for Piestewa Peak Customer Reference board. As
Patrick mentioned, "The AST2400 itself is
host-processor agnostic, so it probably wouldn't be much trouble to get it
running on that board."

Facebook OpenBMC repo is at http://github.com/facebook/openbmc. We are
working with IBM team to have common Linux kernel and u-boot.

Thx,
Tian

On 07/13/2016 09:27 AM, Patrick Williams wrote:
      Hi Dave,

      On Wed, Jul 13, 2016 at 02:38:15PM +0200, David M=FCller (ELSOFT AG)
      wrote:

            Hello

            Does anybody have plans to port or have already ported OpenBMC
            to the
            AST2400 BMC used on the Intel Piestewa Peak Customer Reference
            Board?

            Dave



      Currently, the code tree at http://github.com/openbmc/openbmc only
      supports full functionality on Power8 systems.  The AST2400 itself is
      host-processor agnostic, so it probably wouldn't be much trouble to
      get
      it running on that board.  It would be the userspace apps that
      interact
      with the Host that would need work.

      Facebook has a different code stack that does support Intel
      processors.
      I do not know how close any of their systems would be to this
      reference
      board.

      We are wanting to work with anyone who might be interested in
      extending
      our code-base to support non-Power architectures, but it just isn't
      my
      team's focus.  We have been discussing with Facebook on how to get
      parts
      of the code stack common between our two efforts.  Our main areas of
      focus now have been on Linux kernel and u-boot support.

      Cc'd Teddy @ Facebook so he can forward this around over there.



      =5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F
      openbmc mailing list
      openbmc@lists.ozlabs.org
      https://lists.ozlabs.org/listinfo/openbmc

=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F
openbmc mailing list
openbmc@lists.ozlabs.org
https://lists.ozlabs.org/listinfo/openbmc


--1__=09BBF57CDFE988158f9e8a93df938690918c09BBF57CDFE98815
Content-Transfer-Encoding: quoted-printable
Content-type: text/html; charset=ISO-8859-1
Content-Disposition: inline

<html><body bgcolor=3D"#FFFFFF"><p>Hi David, is that something you would be=
 interested in helping to develop?  <br><br><br>Chris Austen<br>POWER Syste=
ms Enablement Manager <br>(512) 286-5184 (T/L: 363-5184)<br><br><img width=
=3D"16" height=3D"16" src=3D"cid:1=5F=5F=3D09BBF57CDFE988158f9e8a93df938690=
918c09B@" border=3D"0" alt=3D"Inactive hide details for Tian Fang ---07/13/=
2016 11:59:41 AM---Hi Dave, Facebook has been developing OpenBMC for severa=
l Intel"><font color=3D"#424282">Tian Fang ---07/13/2016 11:59:41 AM---Hi D=
ave, Facebook has been developing OpenBMC for several Intel host CPU boards=
</font><br><br><font size=3D"2" color=3D"#5F5F5F">From:        </font><font=
 size=3D"2">Tian Fang &lt;tfang@fb.com&gt;</font><br><font size=3D"2" color=
=3D"#5F5F5F">To:        </font><font size=3D"2">Patrick Williams &lt;patric=
k@stwcx.xyz&gt;, David M=FCller (ELSOFT AG) &lt;d.mueller@elsoft.ch&gt;</fo=
nt><br><font size=3D"2" color=3D"#5F5F5F">Cc:        </font><font size=3D"2=
">openbmc@lists.ozlabs.org, Teddy Reed &lt;teddy@prosauce.org&gt;</font><br=
><font size=3D"2" color=3D"#5F5F5F">Date:        </font><font size=3D"2">07=
/13/2016 11:59 AM</font><br><font size=3D"2" color=3D"#5F5F5F">Subject:    =
    </font><font size=3D"2">Re: OpenBMC port to AST2400 on Piestewa Peak CR=
B?</font><br><font size=3D"2" color=3D"#5F5F5F">Sent by:        </font><fon=
t size=3D"2">&quot;openbmc&quot; &lt;openbmc-bounces+austenc=3Dus.ibm.com@l=
ists.ozlabs.org&gt;</font><br><hr width=3D"100%" size=3D"2" align=3D"left" =
noshade style=3D"color:#8091A5; "><br><br><br><font size=3D"4">Hi Dave,<br>=
<br>Facebook has been developing OpenBMC for several Intel host CPU boards =
using AST2400. But not for Piestewa Peak Customer Reference board. As Patri=
ck mentioned, &quot;The AST2400 itself is<br>host-processor agnostic, so it=
 probably wouldn't be much trouble to get it running on that board.&quot;<b=
r><br>Facebook OpenBMC repo is at </font><a href=3D"http://github.com/faceb=
ook/openbmc"><u><font size=3D"4" color=3D"#0000FF">http://github.com/facebo=
ok/openbmc</font></u></a><font size=3D"4">. We are working with IBM team to=
 have common Linux kernel and u-boot.<br><br>Thx,<br>Tian<br></font><br><fo=
nt size=3D"4">On 07/13/2016 09:27 AM, Patrick Williams wrote:</font><ul><ul=
><tt><font size=3D"4">Hi Dave,<br><br>On Wed, Jul 13, 2016 at 02:38:15PM +0=
200, David M=FCller (ELSOFT AG) wrote:<br></font></tt><ul><ul><tt><font siz=
e=3D"4">Hello<br><br>Does anybody have plans to port or have already ported=
 OpenBMC to the<br>AST2400 BMC used on the Intel Piestewa Peak Customer Ref=
erence Board?<br><br>Dave<br><br></font></tt></ul></ul><tt><font size=3D"4"=
><br>Currently, the code tree at </font></tt><a href=3D"http://github.com/o=
penbmc/openbmc"><tt><u><font size=3D"4" color=3D"#0000FF">http://github.com=
/openbmc/openbmc</font></u></tt></a><tt><font size=3D"4">&nbsp;only<br>supp=
orts full functionality on Power8 systems. &nbsp;The AST2400 itself is<br>h=
ost-processor agnostic, so it probably wouldn't be much trouble to get<br>i=
t running on that board. &nbsp;It would be the userspace apps that interact=
<br>with the Host that would need work.<br><br>Facebook has a different cod=
e stack that does support Intel processors.<br>I do not know how close any =
of their systems would be to this reference<br>board.<br><br>We are wanting=
 to work with anyone who might be interested in extending<br>our code-base =
to support non-Power architectures, but it just isn't my<br>team's focus. &=
nbsp;We have been discussing with Facebook on how to get parts<br>of the co=
de stack common between our two efforts. &nbsp;Our main areas of<br>focus n=
ow have been on Linux kernel and u-boot support.<br><br>Cc'd Teddy @ Facebo=
ok so he can forward this around over there.<br></font></tt><br><font size=
=3D"4"><br></font><br><tt><font size=3D"4">=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F<br>openbmc mailing list<br></font></tt=
><a href=3D"mailto:openbmc@lists.ozlabs.org"><tt><u><font size=3D"4" color=
=3D"#0000FF">openbmc@lists.ozlabs.org</font></u></tt></a><tt><font size=3D"=
4"><br></font></tt><a href=3D"https://lists.ozlabs.org/listinfo/openbmc"><t=
t><u><font size=3D"4" color=3D"#0000FF">https://lists.ozlabs.org/listinfo/o=
penbmc</font></u></tt></a><tt><font size=3D"4"><br></font></tt></ul></ul><t=
t>=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F<br>op=
enbmc mailing list<br>openbmc@lists.ozlabs.org<br></tt><tt><a href=3D"https=
://lists.ozlabs.org/listinfo/openbmc">https://lists.ozlabs.org/listinfo/ope=
nbmc</a></tt><tt><br></tt><br><BR>
</body></html>

--1__=09BBF57CDFE988158f9e8a93df938690918c09BBF57CDFE98815--


--0__=09BBF57CDFE988158f9e8a93df938690918c09BBF57CDFE98815
Content-type: image/gif; 
	name="graycol.gif"
Content-Disposition: inline; filename="graycol.gif"
Content-ID: <1__=09BBF57CDFE988158f9e8a93df938690918c09B@>
Content-Transfer-Encoding: base64

R0lGODlhEAAQAKECAMzMzAAAAP///wAAACH5BAEAAAIALAAAAAAQABAAAAIXlI+py+0PopwxUbpu
ZRfKZ2zgSJbmSRYAIf4fT3B0aW1pemVkIGJ5IFVsZWFkIFNtYXJ0U2F2ZXIhAAA7


--0__=09BBF57CDFE988158f9e8a93df938690918c09BBF57CDFE98815--
