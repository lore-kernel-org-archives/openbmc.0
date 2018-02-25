Return-Path: <stewart@linux.vnet.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=stewart@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zqKsB0RPjzF1Gm
 for <openbmc@lists.ozlabs.org>; Mon, 26 Feb 2018 09:49:33 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w1PMn6tK139065
 for <openbmc@lists.ozlabs.org>; Sun, 25 Feb 2018 17:49:30 -0500
Received: from e12.ny.us.ibm.com (e12.ny.us.ibm.com [129.33.205.202])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2gbnvqdxje-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Sun, 25 Feb 2018 17:49:30 -0500
Received: from localhost
 by e12.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <stewart@linux.vnet.ibm.com>;
 Sun, 25 Feb 2018 17:49:28 -0500
Received: from b01cxnp23034.gho.pok.ibm.com (9.57.198.29)
 by e12.ny.us.ibm.com (146.89.104.199) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Sun, 25 Feb 2018 17:49:26 -0500
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w1PMnOMH45613082; Sun, 25 Feb 2018 22:49:24 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 18D242803A;
 Sun, 25 Feb 2018 17:48:48 -0500 (EST)
Received: from birb.localdomain (unknown [9.185.142.38])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP id 2B14F2803D;
 Sun, 25 Feb 2018 17:48:46 -0500 (EST)
Received: by birb.localdomain (Postfix, from userid 1000)
 id 12FCD4E09AA; Mon, 26 Feb 2018 09:49:19 +1100 (AEDT)
From: Stewart Smith <stewart@linux.vnet.ibm.com>
To: Hariharasubramanian Ramasubramanian <hramasub@in.ibm.com>,
 "Tanous\, Ed" <ed.tanous@intel.com>
Cc: "rolfb\@us.ibm.com" <rolfb@us.ibm.com>,
 "Michael.E.Brown\@dell.com" <Michael.E.Brown@dell.com>,
 "jwcarman\@us.ibm.com" <jwcarman@us.ibm.com>,
 "openbmc\@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "Paul.Vancil\@dell.com" <Paul.Vancil@dell.com>,
 "pradeep.kumar36\@tcs.com" <pradeep.kumar36@tcs.com>,
 "alirhas\@microsoft.com" <alirhas@microsoft.com>,
 "bradleyb\@fuzziesquirrel.com" <bradleyb@fuzziesquirrel.com>,
 "Balaji.B.Rao\@dell.com" <Balaji.B.Rao@dell.com>
Subject: RE: Redfish on OpenBMC
In-Reply-To: <OF31121584.33F1DD5E-ON6525822B.0055E9F8-6525822B.005D34B2@notes.na.collabserv.com>
References: <9FBE92B9-4D49-41CD-9AF7-A5A9E48B25F3@fuzziesquirrel.com>
 <c62f69455ae74650a086a167c7434d37@ausx13mps334.AMER.DELL.COM>
 <OFF0C73A52.E22304BC-ON65258227.0026CCEB-65258227.0032425A@notes.na.collabserv.com>
 <7E9441B1E5EFFD4681F54958E82169932F662C08@ORSMSX114.amr.corp.intel.com>
 <OF31121584.33F1DD5E-ON6525822B.0055E9F8-6525822B.005D34B2@notes.na.collabserv.com>
Date: Mon, 26 Feb 2018 09:49:19 +1100
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
x-cbid: 18022522-0048-0000-0000-0000023F347E
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00008597; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000254; SDB=6.00995071; UDB=6.00505759; IPR=6.00774404; 
 MB=3.00019737; MTD=3.00000008; XFM=3.00000015; UTC=2018-02-25 22:49:28
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18022522-0049-0000-0000-00004440A064
Message-Id: <874lm4ofbk.fsf@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2018-02-25_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1802250302
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Sun, 25 Feb 2018 22:49:34 -0000

Hariharasubramanian Ramasubramanian <hramasub@in.ibm.com> writes:
> Replied inline.

Can you all please get a proper mail client so we can read what's going on?

For a start, replying with colours creates an actively hostile work
environment for those who may not see colours the way you do.

Secondly, for those not using HTML mail, it's *completely* unreadable.
-- 
Stewart Smith
OPAL Architect, IBM.
