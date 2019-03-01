Return-Path: <stewart@linux.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=stewart@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 449XQR3GlszDq6y
 for <openbmc@lists.ozlabs.org>; Fri,  1 Mar 2019 12:49:02 +1100 (AEDT)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x211i80t116330
 for <openbmc@lists.ozlabs.org>; Thu, 28 Feb 2019 20:48:59 -0500
Received: from e33.co.us.ibm.com (e33.co.us.ibm.com [32.97.110.151])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2qxtrc9e70-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 28 Feb 2019 20:48:59 -0500
Received: from localhost
 by e33.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <stewart@linux.ibm.com>;
 Fri, 1 Mar 2019 01:48:58 -0000
Received: from b03cxnp08025.gho.boulder.ibm.com (9.17.130.17)
 by e33.co.us.ibm.com (192.168.1.133) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 1 Mar 2019 01:48:57 -0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x211muUj15925470
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 1 Mar 2019 01:48:56 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 499C66E050;
 Fri,  1 Mar 2019 01:48:56 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 10C446E053;
 Fri,  1 Mar 2019 01:48:55 +0000 (GMT)
Received: from birb.localdomain (unknown [9.185.142.110])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri,  1 Mar 2019 01:48:55 +0000 (GMT)
Received: by birb.localdomain (Postfix, from userid 1000)
 id 8E0B24EC65C; Fri,  1 Mar 2019 12:48:52 +1100 (AEDT)
From: Stewart Smith <stewart@linux.ibm.com>
To: Samuel Mendoza-Jonas <sam@mendozajonas.com>, Lei YU <mine260309@gmail.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Cc: Alexander Amelkin <a.amelkin@yadro.com>
Subject: Re: Static layout PNOR support in openpower-pnor-code-mgmt
In-Reply-To: <6da2e0e6f04ed7bb152db5008137680fc761ed42.camel@mendozajonas.com>
References: <CAARXrtmaOQJ9a224iosU1m+5FSryC4TM7qgBT3n9MYPWzZiQrQ@mail.gmail.com>
 <877edjsazm.fsf@linux.vnet.ibm.com>
 <6da2e0e6f04ed7bb152db5008137680fc761ed42.camel@mendozajonas.com>
Date: Fri, 01 Mar 2019 12:48:52 +1100
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
x-cbid: 19030101-0036-0000-0000-00000A92C122
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00010683; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000281; SDB=6.01167838; UDB=6.00610136; IPR=6.00948451; 
 MB=3.00025786; MTD=3.00000008; XFM=3.00000015; UTC=2019-03-01 01:48:58
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19030101-0037-0000-0000-00004AE265F6
Message-Id: <87pnrbqs8r.fsf@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-03-01_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1903010008
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
X-List-Received-Date: Fri, 01 Mar 2019 01:49:04 -0000

Samuel Mendoza-Jonas <sam@mendozajonas.com> writes:
> On Fri, 2019-03-01 at 11:18 +1100, Stewart Smith wrote:
>> Lei YU <mine260309@gmail.com> writes:
>> > As a follow up of [VPNOR discussion][1], the static layout PNOR
>> > support in openpower-pnor-code-mgmt is implemented and pushed to gerrit
>> > starting from https://gerrit.openbmc-project.xyz/#/c/openbmc/openpower-pnor-code-mgmt/+/18747/
>> > 
>> > Code reviews and tests are welcome.
>> > 
>> > To test the feature:
>> > 1. Pick the above gerrit commits and build with --disable-ubifs_layout
>> > 2. Generate pnor in static.tar.gz format, by below command:
>> >     ./generate-squashfs <xxx.pnor>   # xxx.pnor.static.tar.gz will be
>> > generated
>> 
>> Is this a new format? Why? Where is it documented?
>> 
>
> Looking on gerrit this just appears to be the PNOR and a MANIFEST file in
> a tarball. Considering it's just a call to 'tar', having it be generated
> by something called 'generate-squashfs' is confusing. I guess this is
> because generate-squashfs creates the MANIFEST file?

Yeah, that sounds odd. The current format is just the pnor file.


-- 
Stewart Smith
OPAL Architect, IBM.
