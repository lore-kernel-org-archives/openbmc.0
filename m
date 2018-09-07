Return-Path: <dkodihal@linux.vnet.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=dkodihal@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 426D3n1JMlzF3Sf
 for <openbmc@lists.ozlabs.org>; Fri,  7 Sep 2018 20:20:52 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w87AKmi8038397
 for <openbmc@lists.ozlabs.org>; Fri, 7 Sep 2018 06:20:50 -0400
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2mbmyx64t0-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 07 Sep 2018 06:20:50 -0400
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <dkodihal@linux.vnet.ibm.com>;
 Fri, 7 Sep 2018 11:15:59 +0100
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 7 Sep 2018 11:15:56 +0100
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w87AFtc561800686
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
 for <openbmc@lists.ozlabs.org>; Fri, 7 Sep 2018 10:15:55 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 29D8BAE053
 for <openbmc@lists.ozlabs.org>; Fri,  7 Sep 2018 13:15:16 +0100 (BST)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B7AB5AE055
 for <openbmc@lists.ozlabs.org>; Fri,  7 Sep 2018 13:15:15 +0100 (BST)
Received: from Deepaks-MacBook-Pro.local (unknown [9.77.83.250])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP
 for <openbmc@lists.ozlabs.org>; Fri,  7 Sep 2018 13:15:15 +0100 (BST)
From: Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>
Subject: D-Bus interface to update multiple properties in one shot
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Date: Fri, 7 Sep 2018 15:45:54 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:52.0)
 Gecko/20100101 Thunderbird/52.9.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 18090710-0016-0000-0000-00000201B820
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18090710-0017-0000-0000-00003258680A
Message-Id: <c917aa9a-98ff-d9b7-be60-6000b439742e@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-09-07_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=819 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1807170000 definitions=main-1809070107
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 07 Sep 2018 10:20:53 -0000

Hi,

I've come across openbmc apps that implement D-Bus interfaces comprised 
of more than one D-Bus property (phosphor-networkd is a good example), 
and they need to react only after all the properties or a specific set 
of properties have been set, and not after every individual property is 
set. This can be due to functional or performance reasons. For instance 
in the case of phosphor-networkd, it has to restart a networkd systemd 
unit when a property changes. Multiple restarts can actually cause 
systemd to prevent the unit from further restarts. Multiple restarts is 
also not desirable in terms of the app's performance. What 
phosphor-networkd does today is to start a 5 (or 10) second timer when a 
property is set, and restart the networkd unit after the timeout, so as 
to accumulate other properties being set in this time. I believe other 
daemons are doing this as well.

One solution is to design these APIs as D-Bus methods as opposed to a 
set of D-Bus properties. We've avoided this in general because you'd 
then need to define separate getters and setters, and like mentioned 
earlier, a caller may want to set only a subset of all the properties in 
the interface.

A proposal we discussed in a meet recently is to implement a new 
xyz.openbmc_project.Object.Properties D-Bus interface with a method 
called 'Update', which accepts a dictionary of property-value pairs. A 
D-Bus object may implement this interface to be able to set multiple 
properties in one go. The type of the value would need to be a variant 
of all native D-Bus data types. Supporting container data types is 
probably going to be hard, so this may have to be restricted to 
non-container data types. The key would be a string - the property name. 
Thoughts on this proposal?

Thanks,
Deepak
