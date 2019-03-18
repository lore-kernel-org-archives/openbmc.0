Return-Path: <jrey@linux.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=jrey@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44NK7h4qqgzDqL4
 for <openbmc@lists.ozlabs.org>; Tue, 19 Mar 2019 01:58:40 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x2IEu7FY025591
 for <openbmc@lists.ozlabs.org>; Mon, 18 Mar 2019 10:58:38 -0400
Received: from e36.co.us.ibm.com (e36.co.us.ibm.com [32.97.110.154])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2racc3kv5t-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 18 Mar 2019 10:58:37 -0400
Received: from localhost
 by e36.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <jrey@linux.ibm.com>;
 Mon, 18 Mar 2019 14:58:35 -0000
Received: from b03cxnp07029.gho.boulder.ibm.com (9.17.130.16)
 by e36.co.us.ibm.com (192.168.1.136) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 18 Mar 2019 14:58:33 -0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x2IEwY3W29032586
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 18 Mar 2019 14:58:34 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2261C7805E;
 Mon, 18 Mar 2019 14:58:34 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EF0EF78060;
 Mon, 18 Mar 2019 14:58:29 +0000 (GMT)
Received: from ltc.linux.ibm.com (unknown [9.16.170.189])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 18 Mar 2019 14:58:28 +0000 (GMT)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Mon, 18 Mar 2019 09:58:33 -0500
From: Joseph Reynolds <jrey@linux.ibm.com>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Cc: openbmc@lists.ozlabs.org, openbmc
 <openbmc-bounces+jrey=linux.ibm.com@lists.ozlabs.org>
Subject: Re: API authentication
In-Reply-To: <20190318103504.zcfgdmgqfhi63jte@thinkpad>
References: <20190318103504.zcfgdmgqfhi63jte@thinkpad>
X-Sender: jrey@linux.ibm.com
User-Agent: Roundcube Webmail/1.0.1
X-TM-AS-GCONF: 00
x-cbid: 19031814-0020-0000-0000-00000ECA2F65
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00010780; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000281; SDB=6.01176168; UDB=6.00615173; IPR=6.00956852; 
 MB=3.00026033; MTD=3.00000008; XFM=3.00000015; UTC=2019-03-18 14:58:35
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19031814-0021-0000-0000-00006521B0E9
Message-Id: <91edbcb6aa1390130fb15b11f35e48bd@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-03-18_10:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=543 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1903180111
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
X-List-Received-Date: Mon, 18 Mar 2019 14:58:41 -0000

On 2019-03-18 05:35, Brad Bishop wrote:
> I am looking for ideas on how to implement a mechanism to restrict 
> access to
> specific methods of a service/API (e.g. Redfish).
> 
> This would be orthogonal to role-based authorization - e.g. the 
> authorization
> would be provided by someone other than the system administrator - e.g. 
> the
> system manufacturer.

Is this a followup to the March 4 OpenBMC Community call?  
https://github.com/openbmc/openbmc/wiki/Weekly-Community-Telecon

My understanding is that we would design and code the BMC with functions 
for things like manufacturing test and specialized diagnostics ... 
functions which could harm the device, etc.   So we want the functions 
to be present for manufacturing test and service calls, but locked out 
for all other users.  Is that what this mechanism is for?

- Joseph

> I think I want OAuth for this with these definitions:
> 
> resource owner: system manufacturer
> client: any user of the API (could be application specific but not 
> required)
> resource: data flowing over the API being authorized
> 
> Could the system manufacturer authorize clients on non-internet 
> connected BMCs?
> 
> Is there a better way to go about this?
> 
> Does anyone have any experience with something like this?  I would love 
> to be
> pointed to further reading, code, or just your thoughts in general.
> 
> thx - Brad
