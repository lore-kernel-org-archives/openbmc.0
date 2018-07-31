Return-Path: <tomjose@linux.vnet.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=tomjose@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41fz933F2zzF1Rb
 for <openbmc@lists.ozlabs.org>; Wed,  1 Aug 2018 00:19:50 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w6VE8v4E121636
 for <openbmc@lists.ozlabs.org>; Tue, 31 Jul 2018 10:19:49 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2kjqybcewv-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 31 Jul 2018 10:19:48 -0400
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <tomjose@linux.vnet.ibm.com>;
 Tue, 31 Jul 2018 15:19:46 +0100
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 31 Jul 2018 15:19:44 +0100
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w6VEJhkK42270858
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 31 Jul 2018 14:19:44 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 01432A4040;
 Tue, 31 Jul 2018 17:19:55 +0100 (BST)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 07DAAA4057;
 Tue, 31 Jul 2018 17:19:54 +0100 (BST)
Received: from [9.193.103.216] (unknown [9.193.103.216])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Tue, 31 Jul 2018 17:19:53 +0100 (BST)
Subject: Re: [Maintainers] Call for maintenance
To: openbmc@lists.ozlabs.org
References: <1F65CF12-B31E-409C-BD72-D1CF3D0CFBFC@fuzziesquirrel.com>
Cc: wak@google.com, Bradley W Bishop <bradleyb@us.ibm.com>
From: Tom Joseph <tomjose@linux.vnet.ibm.com>
Date: Tue, 31 Jul 2018 19:49:41 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <1F65CF12-B31E-409C-BD72-D1CF3D0CFBFC@fuzziesquirrel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 18073114-0012-0000-0000-00000291A00B
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18073114-0013-0000-0000-000020C3A472
Message-Id: <ab15c434-61ee-394a-fe89-d211018b8f3e@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-07-31_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=512 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1806210000 definitions=main-1807310137
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
X-List-Received-Date: Tue, 31 Jul 2018 14:19:51 -0000

Hello,

I am scrubbing the phosphor-host-ipmid to handle the SdBusError exception.

Even though sdbusplus::exception::SdBusError is inherited from 
std::exception,
my observation is that catch statement of std::exception does not catch
sdbusplus::exception::SdBusError exception.

try
{
     // Statement throwing sdbusplus::exception::SdBusError exception.
}
catch (const std::exception& e) // Does not catch 
sdbusplus::exception::SdBusError
{

}

I think the multiple inheritance from std::exception is causing this.

Regards,
Tom

On Thursday 12 July 2018 11:22 PM, Brad Bishop wrote:
> I wanted to highlight a recent sdbusplus patch:
>
> https://gerrit.openbmc-project.xyz/#/c/10566/
>
> The nutshell is proper error handling of errors from libsystemd's
> sd_bus_call has been added and sdbusplus::bus::call may now throw
> SdBusError.
>
> This note is an open call to all maintainers to scrub your applications
> for use of sdbusplus::bus::call and handle SdBusError as appropriate.
>
> I want to point out that catching SdBusError in your wrapper function
> around sdbusplus::bus::call and simply eating it (or logging it, tracing
> it, etc) is not really “handling” this new exception.  Nor is wrapping
> your entire program in a try block “handling” it either.  Instead,
> traverse the stack until you find the code with the logic that knows
> whether or not the error is anticipated or not, and handle it there.
>
> For example:
>
> https://gerrit.openbmc-project.xyz/#/c/11423/3/src/propertywatchimpl.hpp
>
> thx - brad
