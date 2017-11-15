Return-Path: <vishwa@linux.vnet.ibm.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=vishwa@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3ycNzF32QJzDqC2
 for <openbmc@lists.ozlabs.org>; Wed, 15 Nov 2017 23:31:36 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 vAFCTpP9100508
 for <openbmc@lists.ozlabs.org>; Wed, 15 Nov 2017 07:31:34 -0500
Received: from e06smtp15.uk.ibm.com (e06smtp15.uk.ibm.com [195.75.94.111])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2e8jcta3wq-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 15 Nov 2017 07:31:33 -0500
Received: from localhost
 by e06smtp15.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <vishwa@linux.vnet.ibm.com>;
 Wed, 15 Nov 2017 12:31:32 -0000
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp15.uk.ibm.com (192.168.101.145) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Wed, 15 Nov 2017 12:31:29 -0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 vAFCVTOl41222192; Wed, 15 Nov 2017 12:31:29 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B2E924C052;
 Wed, 15 Nov 2017 12:26:42 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 277264C046;
 Wed, 15 Nov 2017 12:26:42 +0000 (GMT)
Received: from [9.199.74.35] (unknown [9.199.74.35])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 15 Nov 2017 12:26:41 +0000 (GMT)
Subject: Re: Use of Boost in OpenBMC
To: Brad Bishop <bradleyb@fuzziesquirrel.com>,
 "Tanous, Ed" <ed.tanous@intel.com>
References: <7E9441B1E5EFFD4681F54958E82169932EAF421E@ORSMSX105.amr.corp.intel.com>
 <C3C38226-E41A-44DB-BFA9-2EB06E57AEE7@fuzziesquirrel.com>
Cc: OpenBMC <openbmc@lists.ozlabs.org>
From: vishwa <vishwa@linux.vnet.ibm.com>
Date: Wed, 15 Nov 2017 18:03:02 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <C3C38226-E41A-44DB-BFA9-2EB06E57AEE7@fuzziesquirrel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 17111512-0020-0000-0000-000003CC94CC
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17111512-0021-0000-0000-00004261C91E
Message-Id: <4effb314-f8c7-4f2d-74b4-2f097d050397@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-11-15_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1711150172
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
X-List-Received-Date: Wed, 15 Nov 2017 12:31:37 -0000

I like the proposal of using Boost when it makes more sense.

As an example, In one of the recent code development, I was looking for 
string tokenizer support and could not see that in C++ and Boost had a 
good support of that. I ended up using strtok_r for that development.

!! Vishwa !!

On 11/14/2017 05:49 AM, Brad Bishop wrote:
>> On Nov 13, 2017, at 3:36 PM, Tanous, Ed <ed.tanous@intel.com> wrote:
>>
>> All,
>>   
>> I’d like to start a discussion around the thoughts about the inclusion of Boost headers.  I’ve heard before that it’s a controversial subject.
>>   
>> For record, here’s what the style guide currently says:
>>   
>> Boost, QT, etc.
>>   
>> If you give a mouse a cookie...
>> While, in general, we appreciate reuse over rewriting, we are not using large general-purpose libraries such as Boost. Due to 'Code should be performant: code size' we do not want to utilize the entirety of Boost. If approval is given for a single part of a large general-purpose library it becomes much more difficult to disapprove of another part of the library. Before long, we may have effectively approved of the entire library.
>>   
>> We do look for single feature libraries that can be used in place of our own implementations.
>>   
>> I’d like to start a discussion around challenging a core tenant of this statement, that approval of one part of the library makes it difficult to disapprove other parts.  I would argue that the overhead of making a library available, while still rejecting improper use that effects the project, is much lower than rewriting and debugging equivalent “new” components for openbmc.
>>   
>> I would like to update the coding style conventions with the below verbiage in regards to boost.
>>   
>> Boost
>>   
>> Use of boost is allowed, under the following circumstances:
>> 1.       Use is done as a header-only library.  This allows unused functions and methods to be removed by the compiler at link time, and avoids adding large amounts of overhead and flash usage.
>> 2.       Implementers should include the lowest level header required to solve the problem at hand.  This allows uses to be found and moved forward when new standards are available, as well as reduce compile times, and decrease the possibility of accidental use.  (ie, #include <boost/container/flat_map.hpp>  not #include <boost/container.hpp>)
>> 3.       The module used should not have an equivalent in the std namespace that meets the same requirements for implementation or clarity:  For example, std::chrono should be preferred over boost::chrono.  std::array over boost::array.
>> 4.       Use does not conflict with any of the core tenants of this coding standard (clarity, modern practices, or performance)
>>   
>>   
>> Some examples of libraries in boost that (I believe) would be useful for openbmc:
>> Boost containers (flat_map, flat_set, ect)
>>                  Among other things, this module provides standards compliant containers backed by a sorted vector.  This allows a reduced memory footprint over using std::set or std::map, and in certain use cases can be more performant, or lower memory usage.
>>   
>> Boost asio
>>                  This module provides C++ level networking, sockets, SSL, and asynchronous frameworks that are not available in C++ today.  It has been proposed as a Networking TS to the C++ standards committee.  http://www.open-std.org/jtc1/sc22/wg21/docs/papers/2017/n4656.pdf  This use would likely align us with moving toward compliant standards in the future.
>>   
>> Boost string
>>                  Implementations of common string operations not present in the standard library.  String join, split, case insensitive compare ect.
>>   
>>   
>> I’d like to see what other people opinions are on the matter, and see if we can reach a consensus.
>>   
>> Thanks,
>>   
>> -Ed
>
> This has my support.  I think (hope?) we can rely on a rigorous peer review process to flush out and raise awareness of any questionable usage.
>
> Would it make sense to have another bullet point documented somewhere to this effect?
>
> "If you are considering a boost component, it is suggested you outline your intended usage publicly (the mailing list) to avoid wasted effort if the community does not feel the specific usage is appropriate."
>
> -brad
>
