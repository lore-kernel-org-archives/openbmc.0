Return-Path: <jrey@linux.vnet.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=jrey@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43WSpC4T3WzDqJW
 for <openbmc@lists.ozlabs.org>; Sat,  5 Jan 2019 02:08:03 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 x04Ewmn1102632
 for <openbmc@lists.ozlabs.org>; Fri, 4 Jan 2019 10:08:01 -0500
Received: from e31.co.us.ibm.com (e31.co.us.ibm.com [32.97.110.149])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2pt8gb49nv-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 04 Jan 2019 10:08:00 -0500
Received: from localhost
 by e31.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <jrey@linux.vnet.ibm.com>;
 Fri, 4 Jan 2019 15:08:00 -0000
Received: from b03cxnp08028.gho.boulder.ibm.com (9.17.130.20)
 by e31.co.us.ibm.com (192.168.1.131) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 4 Jan 2019 15:07:58 -0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x04F7vOQ27263040
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 4 Jan 2019 15:07:57 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1F0A46A058;
 Fri,  4 Jan 2019 15:07:57 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EAA476A047;
 Fri,  4 Jan 2019 15:07:56 +0000 (GMT)
Received: from ltc.linux.ibm.com (unknown [9.16.170.189])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri,  4 Jan 2019 15:07:56 +0000 (GMT)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Fri, 04 Jan 2019 09:13:03 -0600
From: Joseph Reynolds <jrey@linux.vnet.ibm.com>
To: Omkar Kuppa <omkar.kuppa@sanmina.com>
Cc: openbmc@lists.ozlabs.org, openbmc
 <openbmc-bounces+jrey=linux.vnet.ibm.com@lists.ozlabs.org>
Subject: Re: Error in running SDK
In-Reply-To: <CAOSNvHqX_Yt0hAeUKq=E1h2cr06QLZaLv4NeZRkfiXV4wQf29w@mail.gmail.com>
References: <CAOSNvHqX_Yt0hAeUKq=E1h2cr06QLZaLv4NeZRkfiXV4wQf29w@mail.gmail.com>
X-Sender: jrey@linux.vnet.ibm.com
User-Agent: Roundcube Webmail/1.0.1
X-TM-AS-GCONF: 00
x-cbid: 19010415-8235-0000-0000-00000E4472B9
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00010344; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000272; SDB=6.01141650; UDB=6.00594194; IPR=6.00921880; 
 MB=3.00024975; MTD=3.00000008; XFM=3.00000015; UTC=2019-01-04 15:07:59
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19010415-8236-0000-0000-000043F3143C
Message-Id: <2f609082be880fbf2df9d1a6279decd1@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-01-04_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1901040132
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
X-List-Received-Date: Fri, 04 Jan 2019 15:08:04 -0000

On 2019-01-04 05:55, Omkar Kuppa wrote:
> Hi all,
> I'm trying to setup Development Environment [1] for openbmc. I'm using
> linux (ubuntu 18.04) in virtual box for the setup. When I ran SDK
> installer ( oecore-x86_64-armv6-toolchain-nodistro.0.sh [2]) the
> following error is displayed.
> "ERROR: INCOMPATIBLE SDK INSTALLER! YOUR HOST IS ARMV6L AND THIS SDK
> WAS BUILT FOR X86_64 HOSTS"
> Please suggest how to resolve this error.

You could build the SDK from source.  See:
https://github.com/openbmc/docs/blob/master/cheatsheet.md

> 
> Thanks in advance,
> Omkar
> [...snip...]
> 
> Links:
> ------
> [1] 
> https://github.com/openbmc/docs/blob/master/development/dev-environment.md
> [2] http://oecore-x86_64-armv6-toolchain-nodistro.0.sh
