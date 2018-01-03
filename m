Return-Path: <dkodihal@linux.vnet.ibm.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=dkodihal@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zBHVW64vMzF0Q3
 for <openbmc@lists.ozlabs.org>; Wed,  3 Jan 2018 15:08:50 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 w03469F6073647
 for <openbmc@lists.ozlabs.org>; Tue, 2 Jan 2018 23:08:48 -0500
Received: from e06smtp15.uk.ibm.com (e06smtp15.uk.ibm.com [195.75.94.111])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2f8me6dwcs-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 02 Jan 2018 23:08:48 -0500
Received: from localhost
 by e06smtp15.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <dkodihal@linux.vnet.ibm.com>;
 Wed, 3 Jan 2018 04:08:46 -0000
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp15.uk.ibm.com (192.168.101.145) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Wed, 3 Jan 2018 04:08:43 -0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w0348guB44236940
 for <openbmc@lists.ozlabs.org>; Wed, 3 Jan 2018 04:08:42 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 61E6BAE055
 for <openbmc@lists.ozlabs.org>; Wed,  3 Jan 2018 04:00:54 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 09DC9AE053
 for <openbmc@lists.ozlabs.org>; Wed,  3 Jan 2018 04:00:54 +0000 (GMT)
Received: from Deepaks-MacBook-Pro.local (unknown [9.79.203.145])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP
 for <openbmc@lists.ozlabs.org>; Wed,  3 Jan 2018 04:00:53 +0000 (GMT)
Subject: Re: Metrics vs Logging, Continued
To: openbmc@lists.ozlabs.org
References: <CY1PR15MB0077EC76B1E96D62AF70ECCACB1E0@CY1PR15MB0077.namprd15.prod.outlook.com>
From: Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>
Date: Wed, 3 Jan 2018 09:38:41 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:52.0)
 Gecko/20100101 Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <CY1PR15MB0077EC76B1E96D62AF70ECCACB1E0@CY1PR15MB0077.namprd15.prod.outlook.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 18010304-0020-0000-0000-000003E60376
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18010304-0021-0000-0000-0000427810F0
Message-Id: <934b65ad-53dd-ca74-c566-bbe9a485a21c@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2018-01-03_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1801030054
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
X-List-Received-Date: Wed, 03 Jan 2018 04:08:53 -0000

On 03/01/18 7:52 am, Christopher Covington wrote:

> https://github.com/facebook/openbmc/tree/helium/common/recipes-rest/rest-api/files
> 
> But polling the whole fleet doesn't seem ideal, so I'm wondering about a push model.
> 
> Prometheus looks interesting, thanks for the pointer. It does seem to support a push model
> https://prometheus.io/docs/instrumenting/pushing/

FWIW, the phosphor rest-server 
(https://github.com/openbmc/phosphor-rest-server) can push events 
occurring in the d-bus namespace to subscribed clients via WebSockets. 
The client subscription protocol has been documented here - 
https://github.com/openbmc/docs/blob/master/rest-api.md (the last section).

Regards,
Deepak
