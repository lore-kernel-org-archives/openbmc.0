Return-Path: <jrey@linux.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=jrey@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44gpmv4sm4zDqSw
 for <openbmc@lists.ozlabs.org>; Sat, 13 Apr 2019 06:06:07 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x3CK4443126219
 for <openbmc@lists.ozlabs.org>; Fri, 12 Apr 2019 16:06:05 -0400
Received: from e36.co.us.ibm.com (e36.co.us.ibm.com [32.97.110.154])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2rtwnahf0t-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 12 Apr 2019 16:06:05 -0400
Received: from localhost
 by e36.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <jrey@linux.ibm.com>;
 Fri, 12 Apr 2019 21:05:54 +0100
Received: from b03cxnp08028.gho.boulder.ibm.com (9.17.130.20)
 by e36.co.us.ibm.com (192.168.1.136) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 12 Apr 2019 21:05:51 +0100
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x3CK5owF31391808
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 12 Apr 2019 20:05:50 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 046336E058;
 Fri, 12 Apr 2019 20:05:50 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CAA9A6E052;
 Fri, 12 Apr 2019 20:05:49 +0000 (GMT)
Received: from ltc.linux.ibm.com (unknown [9.16.170.189])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 12 Apr 2019 20:05:49 +0000 (GMT)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Fri, 12 Apr 2019 15:06:57 -0500
From: Joseph Reynolds <jrey@linux.ibm.com>
To: Joel Stanley <joel@jms.id.au>
Cc: jainmjo@gmail.com, Openbmc <openbmc@lists.ozlabs.org>, openbmc
 <openbmc-bounces+jrey=linux.ibm.com@lists.ozlabs.org>
Subject: Re: [Design] Kernel-based BMC firewall
In-Reply-To: <CACPK8XeoE-SBYp6qrTxAjWym68Y7+KWNKS7+1PBraRBmV6zJeg@mail.gmail.com>
References: <285cb288b03952703b6b879f6a1cac9a@linux.vnet.ibm.com>
 <CADc45smTAr8FBh17mr2oVsHdM_-tpiQ7B1hBFMNG39tP0aBEcA@mail.gmail.com>
 <CACPK8XeoE-SBYp6qrTxAjWym68Y7+KWNKS7+1PBraRBmV6zJeg@mail.gmail.com>
X-Sender: jrey@linux.ibm.com
User-Agent: Roundcube Webmail/1.0.1
X-TM-AS-GCONF: 00
x-cbid: 19041220-0020-0000-0000-00000ED70E6A
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00010915; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000284; SDB=6.01188154; UDB=6.00622422; IPR=6.00968922; 
 MB=3.00026414; MTD=3.00000008; XFM=3.00000015; UTC=2019-04-12 20:05:52
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19041220-0021-0000-0000-000065690412
Message-Id: <732391fe8b9b95773aca84900ad9c1a5@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-04-12_11:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=939 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1904120135
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
X-List-Received-Date: Fri, 12 Apr 2019 20:06:08 -0000

On 2019-03-03 20:00, Joel Stanley wrote:
> On Sat, 2 Mar 2019 at 13:50, jainmjo@gmail.com <jainmjo@gmail.com> 
> wrote:
>> 
>> 
>> On Sat, Mar 2, 2019 at 2:54 AM Joseph Reynolds <jrey@linux.ibm.com> 
>> wrote:
>>> 
>>> 
>>> ## Alternatives Considered
>>> 
>>> A user interface to indicate the firewall's status was considered.
>>> This would invoke iptables and return success only if it showed
>>> firewall rules, something like `iptables -L -n -v`.  This is not
>>> needed for basic function.
>>> 
>>> The `ufw` firewall was considered.  It is implemented in Python which
>>> is being removed from the OpenBMC image.
>> 
>> 
>> iptables is being replaced with nftables (at least in the debian 
>> world). Have you considered nftables?
>> I am very new to OpenBMC. So please correct me if this is not 
>> relevant.
> 
> Agreed. We should be targeting nftables with any new design:
> 
>  https://wiki.nftables.org/wiki-nftables/index.php/Main_Page

Sounds good.  I'll change the design to nft.  Thanks for your input!

- Joseph

> Cheers,
> 
> Joel
> 
> Cheers,
> 
> Joel
