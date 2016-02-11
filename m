Return-Path: <austenc@us.ibm.com>
Received: from e33.co.us.ibm.com (e33.co.us.ibm.com [32.97.110.151])
 (using TLSv1 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id AB4051A003D
 for <openbmc@lists.ozlabs.org>; Fri, 12 Feb 2016 00:36:54 +1100 (AEDT)
Received: from localhost
 by e33.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <austenc@us.ibm.com>;
 Thu, 11 Feb 2016 06:36:52 -0700
Received: from d03dlp02.boulder.ibm.com (9.17.202.178)
 by e33.co.us.ibm.com (192.168.1.133) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 11 Feb 2016 06:36:49 -0700
X-IBM-Helo: d03dlp02.boulder.ibm.com
X-IBM-MailFrom: austenc@us.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26])
 by d03dlp02.boulder.ibm.com (Postfix) with ESMTP id 057523E4003E
 for <openbmc@lists.ozlabs.org>; Thu, 11 Feb 2016 06:36:48 -0700 (MST)
Received: from d01av02.pok.ibm.com (d01av02.pok.ibm.com [9.56.224.216])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u1BDamm334406532
 for <openbmc@lists.ozlabs.org>; Thu, 11 Feb 2016 13:36:48 GMT
Received: from d01av02.pok.ibm.com (localhost [127.0.0.1])
 by d01av02.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u1BDamfo022912
 for <openbmc@lists.ozlabs.org>; Thu, 11 Feb 2016 08:36:48 -0500
Received: from d50lp02.ny.us.ibm.com (d50lp02.pok.ibm.com [146.89.104.208])
 by d01av02.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u1BDakr8022871
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Thu, 11 Feb 2016 08:36:46 -0500
Message-Id: <201602111336.u1BDakr8022871@d01av02.pok.ibm.com>
Received: from /spool/local
 by d50lp02.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <austenc@us.ibm.com>;
 Thu, 11 Feb 2016 08:36:46 -0500
Received: from smtp.notes.na.collabserv.com (192.155.248.74)
 by d50lp02.ny.us.ibm.com (158.87.18.21) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256/256)
 Thu, 11 Feb 2016 08:36:43 -0500
Received: from /spool/local
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <austenc@us.ibm.com>;
 Thu, 11 Feb 2016 13:36:42 -0000
Received: from us1a3-smtp04.a3.dal06.isc4sb.com (10.106.154.237)
 by smtp.notes.na.collabserv.com (10.106.227.92) with
 smtp.notes.na.collabserv.com ESMTP; Thu, 11 Feb 2016 13:36:37 -0000
Received: from us1a3-mail75.a3.dal09.isc4sb.com ([10.142.3.82])
 by us1a3-smtp04.a3.dal06.isc4sb.com
 with ESMTP id 2016021113363644-203290 ;
 Thu, 11 Feb 2016 13:36:36 +0000 
To: "Stewart Smith" <stewart@linux.vnet.ibm.com>
In-Reply-To: <87a8n7pxe6.fsf@linux.vnet.ibm.com>
Date: Thu, 11 Feb 2016 13:36:36 +0000
From: "Chris Austen" <austenc@us.ibm.com>
Subject: Re: Redfish or Irrelevance?
Cc: "openbmc" <openbmc@lists.ozlabs.org>
Importance: Normal
MIME-Version: 1.0
X-Mailer: IBM Traveler 9.0.1.10 Build 201602011006_20 on behalf of device with
 id mdmxxIBM_IOS_ApplFFMQ18K3G5MD,
 type 1600 (iosibm) and description iPhone 6:Apple
 iOS 9.2.1:IBM Traveler/9.3.1.20160121
X-KeepSent: 8B94853A:9095B18D-00257F56:004AC31B;
 type=4; name=$KeepSent
X-LLNOutbound: False
X-Disclaimed: 18627
X-TNEFEvaluated: 1
Content-Type: multipart/alternative; 
 boundary="----=_Part_130_1068253100.1455197796702"
x-cbid: 16021113-0009-0000-0000-000012447996
X-IBM-ISS-SpamDetectors: Score=0.433748; BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0;
 PH=0; SC=0.433748; ST=0; TS=0; UL=0; ISC=
X-IBM-ISS-DetailInfo: BY=3.00004905; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000143; SDB=6.00658401; UDB=6.00298926; UTC=2016-02-11
 13:36:39
x-cbparentid: 16021113-5920-0000-0000-000006164672
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 11 Feb 2016 13:36:55 -0000


------=_Part_130_1068253100.1455197796702
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Redfish is the way to go.  We've talked a lot about it. Timing and knowledg=
e was a couple of reasons why we down the proprietary path.  As such we ins=
ured that while our rest interface was not redfish we did not  make our imp=
lementation completely incompatible.  I think we have learned a lot about r=
edfish and rest and requirements since we started that shows it as winner. =
 I think it is only a matter of time before we move. I think after April it=
 should be the main focus.  =0A   =0A    =0A    Chris=0A  =0A     =0A   Sen=
t from my iPhone using IBM Verse=0A   =0A   On Feb 11, 2016, 1:14:38 AM, "S=
tewart Smith" <stewart@linux.vnet.ibm.com> wrote:=0A   =0A       So, it see=
ms that the standard RESTful API to BMCs is RedFish. With HP,=0A    Intel, =
Dell and others on board (with at least HP iLO shipping product).=0A    The=
re's already an OpenStack Ironic driver for Redfish and a bunch of=0A    ot=
her tooling.=0A    It feels that not going this route would paint us into a=
 corner of=0A    irrelevance and being the tricky platform to deal with.=0A=
    See https://www.dmtf.org/standards/redfish=0A    thoughts?=0A    -- =0A=
    Stewart Smith=0A    OPAL Architect, IBM.=0A    =5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=0A    openbmc mailing list=0A   =
 openbmc@lists.ozlabs.org=0A    https://lists.ozlabs.org/listinfo/openbmc

------=_Part_130_1068253100.1455197796702
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=utf-8

<html><head><META http-equiv=3D"Content-Type" content=3D"text/html;charset=
=3Dutf-8"></head><body><div id=3D"content" contenteditable=3D"true" spellch=
eck=3D"true" autocorrect=3D"true" autocapitalize=3D"true" style=3D"font-fam=
ily: Helvetica;">Redfish is the way to go. &nbsp;We've talked a lot about i=
t. Timing and knowledge was a couple of reasons why we down the proprietary=
 path. &nbsp;As such we insured that while our rest interface was not redfi=
sh we did not &nbsp;make our implementation completely incompatible. &nbsp;=
I think we have learned a lot about redfish and rest and requirements since=
 we started that shows it as winner. &nbsp;I think it is only a matter of t=
ime before we move. I think after April it should be the main focus. &nbsp;=
<div><br></div><div><br></div><div>Chris<br><div><br><br>Sent from my iPhon=
e using IBM Verse<br><br><hr>On Feb 11, 2016, 1:14:38 AM, "Stewart Smith" &=
lt;stewart@linux.vnet.ibm.com&gt; wrote:<br><div style=3D"margin-left: 15px=
;" id=3D"MaaS360PIMSDKOriginalMessageId">So,&nbsp;it&nbsp;seems&nbsp;that&n=
bsp;the&nbsp;standard&nbsp;RESTful&nbsp;API&nbsp;to&nbsp;BMCs&nbsp;is&nbsp;=
RedFish.&nbsp;With&nbsp;HP,<br>Intel,&nbsp;Dell&nbsp;and&nbsp;others&nbsp;o=
n&nbsp;board&nbsp;(with&nbsp;at&nbsp;least&nbsp;HP&nbsp;iLO&nbsp;shipping&n=
bsp;product).<br>There's&nbsp;already&nbsp;an&nbsp;OpenStack&nbsp;Ironic&nb=
sp;driver&nbsp;for&nbsp;Redfish&nbsp;and&nbsp;a&nbsp;bunch&nbsp;of<br>other=
&nbsp;tooling.<br>It&nbsp;feels&nbsp;that&nbsp;not&nbsp;going&nbsp;this&nbs=
p;route&nbsp;would&nbsp;paint&nbsp;us&nbsp;into&nbsp;a&nbsp;corner&nbsp;of<=
br>irrelevance&nbsp;and&nbsp;being&nbsp;the&nbsp;tricky&nbsp;platform&nbsp;=
to&nbsp;deal&nbsp;with.<br>See&nbsp;https://www.dmtf.org/standards/redfish<=
br>thoughts?<br>--&nbsp;<br>Stewart&nbsp;Smith<br>OPAL&nbsp;Architect,&nbsp=
;IBM.<br>=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
<br>openbmc&nbsp;mailing&nbsp;list<br>openbmc@lists.ozlabs.org<br>https://l=
ists.ozlabs.org/listinfo/openbmc<br></div></div></div></div><BR>
</body></html>

------=_Part_130_1068253100.1455197796702--
