Return-Path: <mspinler@linux.vnet.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=mspinler@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43pphG3grmzDqHJ
 for <openbmc@lists.ozlabs.org>; Wed, 30 Jan 2019 01:26:06 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x0TEIXZq102320
 for <openbmc@lists.ozlabs.org>; Tue, 29 Jan 2019 09:26:04 -0500
Received: from e35.co.us.ibm.com (e35.co.us.ibm.com [32.97.110.153])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2qapytx47n-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 29 Jan 2019 09:26:03 -0500
Received: from localhost
 by e35.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <mspinler@linux.vnet.ibm.com>;
 Tue, 29 Jan 2019 14:26:01 -0000
Received: from b03cxnp08026.gho.boulder.ibm.com (9.17.130.18)
 by e35.co.us.ibm.com (192.168.1.135) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 29 Jan 2019 14:25:58 -0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x0TEPvg827394108
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 29 Jan 2019 14:25:57 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 538856A05A;
 Tue, 29 Jan 2019 14:25:57 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3274A6A061;
 Tue, 29 Jan 2019 14:25:57 +0000 (GMT)
Received: from ltc.linux.ibm.com (unknown [9.16.170.189])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 29 Jan 2019 14:25:57 +0000 (GMT)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Tue, 29 Jan 2019 08:32:06 -0600
From: Matt Spinler <mspinler@linux.vnet.ibm.com>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Cc: openbmc@lists.ozlabs.org
Subject: Re: REST API authentication changes coming soon
In-Reply-To: <f7bae68a4338da902ff1b43c03f38ee16cf16c79.camel@fuzziesquirrel.com>
References: <f7bae68a4338da902ff1b43c03f38ee16cf16c79.camel@fuzziesquirrel.com>
X-Sender: mspinler@linux.vnet.ibm.com
User-Agent: Roundcube Webmail/1.0.1
X-TM-AS-GCONF: 00
x-cbid: 19012914-0012-0000-0000-00001701A9A5
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00010499; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000277; SDB=6.01153485; UDB=6.00601377; IPR=6.00933851; 
 MB=3.00025338; MTD=3.00000008; XFM=3.00000015; UTC=2019-01-29 14:25:59
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19012914-0013-0000-0000-000056009C87
Message-Id: <a4c896ca2ad943cb669e2ceaf09955ff@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-01-29_10:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1901290108
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
X-List-Received-Date: Tue, 29 Jan 2019 14:26:07 -0000

On 2019-01-28 12:52, Brad Bishop wrote:
> I just wanted to re-announce this change in a very visible way:
> 
> https://lists.ozlabs.org/pipermail/openbmc/2019-January/014881.html
> 
> I'm not sure how to interpret the silence.  There will be some impact
> to any programatic use of the current REST API when we make this
> switch.  If you have issues with that please speak up so we can see
> about what we can do to help ease the transition.


There is a review in progress at
https://gerrit.openbmc-project.xyz/#/c/openbmc/docs/+/17706/ with the
new authentication details.

Other differences I've noticed from phosphor-rest:
* URLs are case sensitive
* Will not interpolate strings to ints
   e.g. won't covert "1000" to 1000 if D-Bus arg is an int
* Not tolerant on things like double '/'s in the URL
   e.g. /xyz/openbmc_project//attr/blah... will not work



> thx - brad
