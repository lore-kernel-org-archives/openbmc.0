Return-Path: <hramasub@in.ibm.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=in.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=hramasub@in.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zM9Q856ZgzDq8c
 for <openbmc@lists.ozlabs.org>; Thu, 18 Jan 2018 02:05:51 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w0HF4OQu111225
 for <openbmc@lists.ozlabs.org>; Wed, 17 Jan 2018 10:05:49 -0500
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.74])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2fj5xrh3gq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 17 Jan 2018 10:05:49 -0500
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <hramasub@in.ibm.com>;
 Wed, 17 Jan 2018 15:05:46 -0000
Received: from us1a3-smtp05.a3.dal06.isc4sb.com (10.146.71.159)
 by smtp.notes.na.collabserv.com (10.106.227.92) with
 smtp.notes.na.collabserv.com ESMTP; Wed, 17 Jan 2018 15:04:31 -0000
Received: from us1a3-mail111.a3.dal06.isc4sb.com ([10.146.45.113])
 by us1a3-smtp05.a3.dal06.isc4sb.com
 with ESMTP id 2018011715043144-694850 ;
 Wed, 17 Jan 2018 15:04:31 +0000 
MIME-Version: 1.0
In-Reply-To: <1516133413.8689.5.camel@fuzziesquirrel.com>
Subject: Re: async notifications (snmp, redfish)
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Cc: openbmc@lists.ozlabs.org
From: "Hariharasubramanian Ramasubramanian" <hramasub@in.ibm.com>
Date: Wed, 17 Jan 2018 20:34:30 +0530
References: <1516133413.8689.5.camel@fuzziesquirrel.com>
X-KeepSent: A2F3676A:CBD54DF8-65258218:00516BE2;
 type=4; name=$KeepSent
X-Mailer: IBM Notes Release 9.0.1FP7 August 18, 2016
X-LLNOutbound: False
X-Disclaimed: 22267
X-TNEFEvaluated: 1
Content-type: multipart/related; 
 Boundary="0__=EABB088BDFC2ED728f9e8a93df938690918cEABB088BDFC2ED72"
x-cbid: 18011715-7581-0000-0000-000005833A64
X-IBM-SpamModules-Scores: BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.406879; ST=0; TS=0; UL=0; ISC=; MB=0.105974
X-IBM-SpamModules-Versions: BY=3.00008395; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000247; SDB=6.00976364; UDB=6.00494941; IPR=6.00756291; 
 BA=6.00005782; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00019093; XFM=3.00000015;
 UTC=2018-01-17 15:05:44
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2018-01-17 12:26:37 - 6.00007920
x-cbparentid: 18011715-7582-0000-0000-0000E7115994
Message-Id: <OFA2F3676A.CBD54DF8-ON65258218.00516BE2-65258218.0052CF59@notes.na.collabserv.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2018-01-17_05:, , signatures=0
X-Proofpoint-Spam-Reason: safe
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 17 Jan 2018 15:06:18 -0000

--0__=EABB088BDFC2ED728f9e8a93df938690918cEABB088BDFC2ED72
Content-type: multipart/alternative; 
	Boundary="1__=EABB088BDFC2ED728f9e8a93df938690918cEABB088BDFC2ED72"


--1__=EABB088BDFC2ED728f9e8a93df938690918cEABB088BDFC2ED72
Content-Transfer-Encoding: quoted-printable
Content-type: text/plain; charset=US-ASCII


Redifh defines a push model for async notification. However the events,
semantics of the events and the corresponding description of those events
are left open to be defined by the OEMs.

i.e. a =5Fstandard=5F Event Registry is a work in progress in DMTF.
Here is a post on the redfish forum for a query which we had posted
earlier: https://redfishforum.com/post/268/quote/81

This is the right time to start a discussion on the standard set of events.

regards,
Hari !




From:	Brad Bishop <bradleyb@fuzziesquirrel.com>
To:	openbmc@lists.ozlabs.org
Date:	01/17/2018 01:41 AM
Subject:	async notifications (snmp, redfish)
Sent by:	"openbmc" <openbmc-bounces
            +hramasub=3Din.ibm.com@lists.ozlabs.org>



Does anyone out there care about async notifications (as in something
like SNMP)?  Looking for any ideas and/or information around existing
FOSS solutions in that problem space, and/or if there aren't any, other
ideas on a solution for OpenBMC.  How do people feel about what Redfish
has done for these?

thx - brad




--1__=EABB088BDFC2ED728f9e8a93df938690918cEABB088BDFC2ED72
Content-Transfer-Encoding: quoted-printable
Content-type: text/html; charset=US-ASCII
Content-Disposition: inline

<html><body><p><font size=3D"2">Redifh defines a push model for async notif=
ication. However the events, semantics of the events and the corresponding =
description of those events are left open to be defined by the OEMs.</font>=
<br><br><font size=3D"2">i.e. a =5Fstandard=5F Event Registry is a work in =
progress in DMTF.</font><br><font size=3D"2">Here is a post on the redfish =
forum for a query which we had posted earlier: </font><a href=3D"https://re=
dfishforum.com/post/268/quote/81"><font size=3D"2">https://redfishforum.com=
/post/268/quote/81</font></a><br><font size=3D"2"><br>This is the right tim=
e to start a discussion on the standard set of events. </font><br><br><font=
 size=3D"2">regards,</font><br><font size=3D"2">Hari !</font><br><br><br><i=
mg width=3D"16" height=3D"16" src=3D"cid:1=5F=5F=3DEABB088BDFC2ED728f9e8a93=
df938690918cEAB@" border=3D"0" alt=3D"Inactive hide details for Brad Bishop=
 ---01/17/2018 01:41:08 AM---Does anyone out there care about async notific=
ations (as in s"><font size=3D"2" color=3D"#424282">Brad Bishop ---01/17/20=
18 01:41:08 AM---Does anyone out there care about async notifications (as i=
n something like SNMP)?  Looking for any i</font><br><br><font size=3D"2" c=
olor=3D"#5F5F5F">From:        </font><font size=3D"2">Brad Bishop &lt;bradl=
eyb@fuzziesquirrel.com&gt;</font><br><font size=3D"2" color=3D"#5F5F5F">To:=
        </font><font size=3D"2">openbmc@lists.ozlabs.org</font><br><font si=
ze=3D"2" color=3D"#5F5F5F">Date:        </font><font size=3D"2">01/17/2018 =
01:41 AM</font><br><font size=3D"2" color=3D"#5F5F5F">Subject:        </fon=
t><font size=3D"2">async notifications (snmp, redfish)</font><br><font size=
=3D"2" color=3D"#5F5F5F">Sent by:        </font><font size=3D"2">&quot;open=
bmc&quot; &lt;openbmc-bounces+hramasub=3Din.ibm.com@lists.ozlabs.org&gt;</f=
ont><br><hr width=3D"100%" size=3D"2" align=3D"left" noshade style=3D"color=
:#8091A5; "><br><br><br><tt><font size=3D"2">Does anyone out there care abo=
ut async notifications (as in something<br>like SNMP)? &nbsp;Looking for an=
y ideas and/or information around existing<br>FOSS solutions in that proble=
m space, and/or if there aren't any, other<br>ideas on a solution for OpenB=
MC. &nbsp;How do people feel about what Redfish<br>has done for these?<br><=
br>thx - brad<br><br></font></tt><br><br><BR>
</body></html>

--1__=EABB088BDFC2ED728f9e8a93df938690918cEABB088BDFC2ED72--


--0__=EABB088BDFC2ED728f9e8a93df938690918cEABB088BDFC2ED72
Content-type: image/gif; 
	name="graycol.gif"
Content-Disposition: inline; filename="graycol.gif"
Content-ID: <1__=EABB088BDFC2ED728f9e8a93df938690918cEAB@>
Content-Transfer-Encoding: base64

R0lGODlhEAAQAKECAMzMzAAAAP///wAAACH5BAEAAAIALAAAAAAQABAAAAIXlI+py+0PopwxUbpu
ZRfKZ2zgSJbmSRYAIf4fT3B0aW1pemVkIGJ5IFVsZWFkIFNtYXJ0U2F2ZXIhAAA7


--0__=EABB088BDFC2ED728f9e8a93df938690918cEABB088BDFC2ED72--
