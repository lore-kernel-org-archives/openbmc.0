Return-Path: <hramasub@in.ibm.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=in.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=hramasub@in.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zdJtZ5rCczF0m9
 for <openbmc@lists.ozlabs.org>; Sat, 10 Feb 2018 02:31:02 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w19FTgJ3135223
 for <openbmc@lists.ozlabs.org>; Fri, 9 Feb 2018 10:31:00 -0500
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.81])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2g1actve0r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 09 Feb 2018 10:30:52 -0500
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <hramasub@in.ibm.com>;
 Fri, 9 Feb 2018 15:30:51 -0000
Received: from us1a3-smtp06.a3.dal06.isc4sb.com (10.146.103.243)
 by smtp.notes.na.collabserv.com (10.106.227.88) with
 smtp.notes.na.collabserv.com ESMTP; Fri, 9 Feb 2018 15:30:40 -0000
Received: from us1a3-mail111.a3.dal06.isc4sb.com ([10.146.45.113])
 by us1a3-smtp06.a3.dal06.isc4sb.com
 with ESMTP id 2018020915303964-701405 ;
 Fri, 9 Feb 2018 15:30:39 +0000 
MIME-Version: 1.0
In-Reply-To: <53D123781965AE42A2ABEE982B242E417C8E5B6E@IRSMSX102.ger.corp.intel.com>
Subject: RE: Redfish on OpenBMC
To: "Rapkiewicz, Pawel" <pawel.rapkiewicz@intel.com>
Cc: Ali Larijani <alirhas@microsoft.com>, "Balaji.B.Rao@dell.com"
 <Balaji.B.Rao@dell.com>, "bradleyb@fuzziesquirrel.com"
 <bradleyb@fuzziesquirrel.com>, Chris Ong <Chris.Ong@microsoft.com>,
 "Tanous, Ed" <ed.tanous@intel.com>, "jwcarman@us.ibm.com"
 <jwcarman@us.ibm.com>, "Michael.E.Brown@dell.com"
 <Michael.E.Brown@dell.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>, "Paul.Vancil@dell.com" <Paul.Vancil@dell.com>,
 "pradeep.kumar36@tcs.com" <pradeep.kumar36@tcs.com>,
 "rolfb@us.ibm.com" <rolfb@us.ibm.com>, Yugi Mani <yupalani@microsoft.com>
From: "Hariharasubramanian Ramasubramanian" <hramasub@in.ibm.com>
Date: Fri, 9 Feb 2018 21:00:41 +0530
References: <9FBE92B9-4D49-41CD-9AF7-A5A9E48B25F3@fuzziesquirrel.com>
 <c62f69455ae74650a086a167c7434d37@ausx13mps334.AMER.DELL.COM>
 <OFF0C73A52.E22304BC-ON65258227.0026CCEB-65258227.0032425A@notes.na.collabserv.com>
 <c73bb370335c45dab208cb0e708a08f4@AUSX13MPS306.AMER.DELL.COM>
 <BL0PR2101MB09150499921D8E104CEB9618ADFA0@BL0PR2101MB0915.namprd21.prod.outlook.com>
 <MWHPR21MB0864D2D2F00B56C21A5917F4D6FC0@MWHPR21MB0864.namprd21.prod.outlook.com>
 <7E9441B1E5EFFD4681F54958E82169932F663F86@ORSMSX114.amr.corp.intel.com>
 <BL0PR2101MB0897B2A1BB35747988A92BCDEAFC0@BL0PR2101MB0897.namprd21.prod.outlook.com>
 <53D123781965AE42A2ABEE982B242E417C8E5B6E@IRSMSX102.ger.corp.intel.com>
X-KeepSent: 7D363723:19DBE6CA-6525822F:00549289;
 type=4; flags=0; name=$KeepSent
X-Mailer: IBM Notes Release 9.0.1FP7 August 18, 2016
X-LLNOutbound: False
X-Disclaimed: 62567
X-TNEFEvaluated: 1
Content-type: multipart/alternative; 
 Boundary="0__=EABB08BCDFC714198f9e8a93df938690918cEABB08BCDFC71419"
Content-Disposition: inline
x-cbid: 18020915-7093-0000-0000-0000053FE4EC
X-IBM-SpamModules-Scores: BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.417846; ST=0; TS=0; UL=0; ISC=; MB=0.019478
X-IBM-SpamModules-Versions: BY=3.00008504; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000251; SDB=6.00987251; UDB=6.00501096; IPR=6.00766609; 
 BA=6.00005821; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00019459; XFM=3.00000015;
 UTC=2018-02-09 15:30:48
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2018-02-09 11:37:05 - 6.00008031
x-cbparentid: 18020915-7094-0000-0000-00003AEC031C
Message-Id: <OF7D363723.19DBE6CA-ON6525822F.00549289-6525822F.00553540@notes.na.collabserv.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2018-02-09_08:, , signatures=0
X-Proofpoint-Spam-Reason: safe
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.25
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 09 Feb 2018 15:31:03 -0000


--0__=EABB08BCDFC714198f9e8a93df938690918cEABB08BCDFC71419
Content-Transfer-Encoding: quoted-printable
Content-type: text/plain; charset=US-ASCII




"Rapkiewicz, Pawel" <pawel.rapkiewicz@intel.com> wrote on 02/08/2018
07:47:02 PM:


> Thanks for your benchmarking you've attached, I'd like to better
> understand the data. I'm curious about 10 concurrent requests for
> redfish root service. The average is ~5 seconds for uwsgi, and
> mostly no response for gevent.
> Few questions:
> - gevent and uwsgi, those are two independent redfish server
implementations?
> - do you have any traffic during retrieving root service?
> - Was it with Basic HTTP Auth, or without any?
>
I gather Microsoft implementation supports only Basic Auth. Redfish
requires all requests (apart from requests for service root, metadata and
session establishment) to be authenticated. Hence I surmise that the
performance results are "with Basic HTTP Auth".

Hari !

--0__=EABB08BCDFC714198f9e8a93df938690918cEABB08BCDFC71419
Content-Transfer-Encoding: quoted-printable
Content-type: text/html; charset=US-ASCII
Content-Disposition: inline

<html><body><p><tt><font size=3D"2">&quot;Rapkiewicz, Pawel&quot; &lt;pawel=
.rapkiewicz@intel.com&gt; wrote on 02/08/2018 07:47:02 PM:<br><br><br>&gt; =
Thanks for your benchmarking you've attached, I'd like to better <br>&gt; u=
nderstand the data. I'm curious about 10 concurrent requests for <br>&gt; r=
edfish root service. The average is ~5 seconds for uwsgi, and <br>&gt; most=
ly no response for gevent.<br>&gt; Few questions:<br>&gt; - gevent and uwsg=
i, those are two independent redfish server implementations?<br>&gt; - do y=
ou have any traffic during retrieving root service?<br>&gt; - Was it with B=
asic HTTP Auth, or without any?<br>&gt; <br>I gather Microsoft implementati=
on supports only Basic Auth. Redfish requires all requests (apart from requ=
ests for service root, metadata and session establishment) to be authentica=
ted. Hence I surmise that the performance results are &quot;with Basic HTTP=
 Auth&quot;.</font></tt><br><br><tt><font size=3D"2">Hari !</font></tt><BR>
</body></html>

--0__=EABB08BCDFC714198f9e8a93df938690918cEABB08BCDFC71419--
