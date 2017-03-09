Return-Path: <hramasub@in.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vf8Pf23ylzDqXj
 for <openbmc@lists.ozlabs.org>; Thu,  9 Mar 2017 23:11:17 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v29C8wv5035855
 for <openbmc@lists.ozlabs.org>; Thu, 9 Mar 2017 07:11:12 -0500
Received: from e28smtp07.in.ibm.com (e28smtp07.in.ibm.com [125.16.236.7])
 by mx0a-001b2d01.pphosted.com with ESMTP id 29358amms2-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 09 Mar 2017 07:11:11 -0500
Received: from localhost
 by e28smtp07.in.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <hramasub@in.ibm.com>;
 Thu, 9 Mar 2017 17:41:08 +0530
Received: from d28relay10.in.ibm.com (9.184.220.161)
 by e28smtp07.in.ibm.com (192.168.1.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Thu, 9 Mar 2017 17:41:07 +0530
Received: from d50lp31.co.us.ibm.com (d50lp31.boulder.ibm.com [9.17.249.32])
 by d28relay10.in.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v29C9tnO20840448
 for <openbmc@lists.ozlabs.org>; Thu, 9 Mar 2017 17:39:57 +0530
Received: from localhost
 by d50lp31.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <hramasub@in.ibm.com>;
 Thu, 9 Mar 2017 05:11:04 -0700
Received: from smtp.notes.na.collabserv.com (192.155.248.66)
 by d50lp31.co.us.ibm.com (192.168.2.141) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128/128)
 Thu, 9 Mar 2017 05:11:02 -0700
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <hramasub@in.ibm.com>;
 Thu, 9 Mar 2017 12:11:01 -0000
Received: from us1a3-smtp03.a3.dal06.isc4sb.com (10.106.154.98)
 by smtp.notes.na.collabserv.com (10.106.227.127) with
 smtp.notes.na.collabserv.com ESMTP; Thu, 9 Mar 2017 12:11:00 -0000
Received: from us1a3-mail111.a3.dal06.isc4sb.com ([10.146.45.113])
 by us1a3-smtp03.a3.dal06.isc4sb.com
 with ESMTP id 2017030912105908-229469 ;
 Thu, 9 Mar 2017 12:10:59 +0000 
MIME-Version: 1.0
In-Reply-To: <20170309043357.GA26189@heinlein.lan>
Subject: Re: DHCP client behavior
To: Patrick Williams <patrick@stwcx.xyz>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
From: "Hariharasubramanian Ramasubramanian" <hramasub@in.ibm.com>
Date: Thu, 9 Mar 2017 17:40:55 +0530
References: <20170309043357.GA26189@heinlein.lan>
X-KeepSent: 5F93ADB6:EA5888AB-652580DE:00422969;
 type=4; name=$KeepSent
X-Mailer: IBM Notes Release 9.0.1FP7 August 18, 2016
X-LLNOutbound: False
X-Disclaimed: 18787
X-TNEFEvaluated: 1
Content-type: multipart/related; 
 Boundary="0__=EABB0A4DDFD1AFF98f9e8a93df938690918cEABB0A4DDFD1AFF9"
x-cbid: 17030912-0024-0000-0000-000003B00AC5
X-IBM-SpamModules-Scores: FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0; SC=0.406879;
 ST=0; TS=0; UL=0; ISC=; MB=0.131299
X-IBM-SpamModules-Versions: BY=3.00006750; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000206; SDB=6.00832157; UDB=6.00408355; IPR=6.00609744; 
 BA=6.00005202; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00014571; XFM=3.00000013;
 UTC=2017-03-09 12:11:00
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2017-03-09 10:46:59 - 6.00006410
x-cbparentid: 17030912-6358-0000-0000-0000032B6CDB
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
Message-Id: <OF5F93ADB6.EA5888AB-ON652580DE.00422969-652580DE.0042EAED@notes.na.collabserv.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-03-09_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1702020001
 definitions=main-1703090093
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
X-List-Received-Date: Thu, 09 Mar 2017 12:11:18 -0000

--0__=EABB0A4DDFD1AFF98f9e8a93df938690918cEABB0A4DDFD1AFF9
Content-type: multipart/alternative; 
	Boundary="1__=EABB0A4DDFD1AFF98f9e8a93df938690918cEABB0A4DDFD1AFF9"


--1__=EABB0A4DDFD1AFF98f9e8a93df938690918cEABB0A4DDFD1AFF9
Content-Transfer-Encoding: quoted-printable
Content-type: text/plain; charset=US-ASCII


a) Default the Client ID to the MAC addr
b) Provide an interface (rest?) on the BMC  to configure / provision the
Client ID to an arbitrary string (e.g. ibm-obmc -007)

The need to provision the client ID can be based on the IP addr allocation
policy defined on the DHCP *server* in the data center.

One such use case view here:
https://www.net.princeton.edu/announcements/dhcp-cliid-must-match-chaddr.ht=
ml

regards,
Hari !

Hariharasubramanian R.
Power Firmware Development
IBM India Systems & Technology Lab, Bangalore, India
Phone:  +91 80 4025 6950



From:	Patrick Williams <patrick@stwcx.xyz>
To:	OpenBMC Maillist <openbmc@lists.ozlabs.org>
Date:	03/09/2017 10:04 AM
Subject:	DHCP client behavior
Sent by:	"openbmc" <openbmc-bounces
            +hramasub=3Din.ibm.com@lists.ozlabs.org>



All,

I'm looking for feedback from any networking experts.  We had an issue
reported by Witherspoon system manufacturing that our DHCP client was
not sending MAC addresses as part of the DHCP request as legacy systems
did.  I tracked this down to newer behavior in DHCP clients called
'DUID's, which are intended to be system-specific rather than
interface-specific identifiers (MACs would be interface-specific).

There are three options for IPv4 DHCP clients and two for IPv6:
    * MAC address based client IDs (legacy behavior, IPv4 only).
    * System UUID based DUIDs (single ID per system).
    * IPv6 'link-layer' based DUIDs (single ID per interface?)

I'm curious if anyone has a perspective on how data-centers would like
a BMC to act based on the three options for IPv4.  IPv6 we will need to
decide between system or interface based IDs.  (ie. what should be our
default configuration; individual vendors can always change.)

I have created an issue on Github to track the long-term decision and
as a temporary solution I forced IPv4 to MAC.

Original issue is at [1], follow up for this assessment is at [2], "fix"
in Gerrit is at [3].


[1] https://github.com/openbmc/openbmc/issues/1272
[2] https://github.com/openbmc/openbmc/issues/1280
[3] https://gerrit.openbmc-project.xyz/#/c/2933/

--
Patrick Williams
[attachment "signature.asc" deleted by Hariharasubramanian
Ramasubramanian/India/IBM]


--1__=EABB0A4DDFD1AFF98f9e8a93df938690918cEABB0A4DDFD1AFF9
Content-Transfer-Encoding: quoted-printable
Content-type: text/html; charset=US-ASCII
Content-Disposition: inline

<html><body><p>a) Default the Client ID to the MAC addr<br>b) Provide an in=
terface (rest?) on the BMC  to configure / provision the Client ID to an ar=
bitrary string (e.g. ibm-obmc -007)<br><br>The need to provision the client=
 ID can be based on the IP addr allocation policy defined on the DHCP *serv=
er* in the data center.<br><br>One such use case view here: <a href=3D"http=
s://www.net.princeton.edu/announcements/dhcp-cliid-must-match-chaddr.html">=
https://www.net.princeton.edu/announcements/dhcp-cliid-must-match-chaddr.ht=
ml</a><br><br>regards,<br>Hari !<br><br>Hariharasubramanian R.<br>Power Fir=
mware Development<br>IBM India Systems &amp; Technology Lab, Bangalore, Ind=
ia<br>Phone:  +91 80 4025 6950   <br><br><img width=3D"16" height=3D"16" sr=
c=3D"cid:1=5F=5F=3DEABB0A4DDFD1AFF98f9e8a93df938690918cEAB@" border=3D"0" a=
lt=3D"Inactive hide details for Patrick Williams ---03/09/2017 10:04:26 AM-=
--All, I'm looking for feedback from any networking expert"><font color=3D"=
#424282">Patrick Williams ---03/09/2017 10:04:26 AM---All, I'm looking for =
feedback from any networking experts.  We had an issue</font><br><br><font =
size=3D"2" color=3D"#5F5F5F">From:        </font><font size=3D"2">Patrick W=
illiams &lt;patrick@stwcx.xyz&gt;</font><br><font size=3D"2" color=3D"#5F5F=
5F">To:        </font><font size=3D"2">OpenBMC Maillist &lt;openbmc@lists.o=
zlabs.org&gt;</font><br><font size=3D"2" color=3D"#5F5F5F">Date:        </f=
ont><font size=3D"2">03/09/2017 10:04 AM</font><br><font size=3D"2" color=
=3D"#5F5F5F">Subject:        </font><font size=3D"2">DHCP client behavior</=
font><br><font size=3D"2" color=3D"#5F5F5F">Sent by:        </font><font si=
ze=3D"2">&quot;openbmc&quot; &lt;openbmc-bounces+hramasub=3Din.ibm.com@list=
s.ozlabs.org&gt;</font><br><hr width=3D"100%" size=3D"2" align=3D"left" nos=
hade style=3D"color:#8091A5; "><br><br><br><tt>All,<br><br>I'm looking for =
feedback from any networking experts. &nbsp;We had an issue<br>reported by =
Witherspoon system manufacturing that our DHCP client was<br>not sending MA=
C addresses as part of the DHCP request as legacy systems<br>did. &nbsp;I t=
racked this down to newer behavior in DHCP clients called<br>'DUID's, which=
 are intended to be system-specific rather than<br>interface-specific ident=
ifiers (MACs would be interface-specific).<br><br>There are three options f=
or IPv4 DHCP clients and two for IPv6:<br> &nbsp; &nbsp;* MAC address based=
 client IDs (legacy behavior, IPv4 only).<br> &nbsp; &nbsp;* System UUID ba=
sed DUIDs (single ID per system).<br> &nbsp; &nbsp;* IPv6 'link-layer' base=
d DUIDs (single ID per interface?)<br><br>I'm curious if anyone has a persp=
ective on how data-centers would like<br>a BMC to act based on the three op=
tions for IPv4. &nbsp;IPv6 we will need to<br>decide between system or inte=
rface based IDs. &nbsp;(ie. what should be our<br>default configuration; in=
dividual vendors can always change.)<br><br>I have created an issue on Gith=
ub to track the long-term decision and<br>as a temporary solution I forced =
IPv4 to MAC.<br><br>Original issue is at [1], follow up for this assessment=
 is at [2], &quot;fix&quot;<br>in Gerrit is at [3].<br><br><br>[1] </tt><tt=
><a href=3D"https://github.com/openbmc/openbmc/issues/1272">https://github.=
com/openbmc/openbmc/issues/1272</a></tt><tt><br>[2] </tt><tt><a href=3D"htt=
ps://github.com/openbmc/openbmc/issues/1280">https://github.com/openbmc/ope=
nbmc/issues/1280</a></tt><tt><br>[3] </tt><tt><a href=3D"https://gerrit.ope=
nbmc-project.xyz/#/c/2933/">https://gerrit.openbmc-project.xyz/#/c/2933/</a=
></tt><tt><br><br>-- <br>Patrick Williams<br>[attachment &quot;signature.as=
c&quot; deleted by Hariharasubramanian Ramasubramanian/India/IBM] </tt><br>=
<br><BR>
</body></html>

--1__=EABB0A4DDFD1AFF98f9e8a93df938690918cEABB0A4DDFD1AFF9--


--0__=EABB0A4DDFD1AFF98f9e8a93df938690918cEABB0A4DDFD1AFF9
Content-type: image/gif; 
	name="graycol.gif"
Content-Disposition: inline; filename="graycol.gif"
Content-ID: <1__=EABB0A4DDFD1AFF98f9e8a93df938690918cEAB@>
Content-Transfer-Encoding: base64

R0lGODlhEAAQAKECAMzMzAAAAP///wAAACH5BAEAAAIALAAAAAAQABAAAAIXlI+py+0PopwxUbpu
ZRfKZ2zgSJbmSRYAIf4fT3B0aW1pemVkIGJ5IFVsZWFkIFNtYXJ0U2F2ZXIhAAA7


--0__=EABB0A4DDFD1AFF98f9e8a93df938690918cEABB0A4DDFD1AFF9--
