Return-Path: <anoo@linux.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=anoo@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41qZDK5fzPzF15Q
 for <openbmc@lists.ozlabs.org>; Wed, 15 Aug 2018 00:07:29 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w7EE6Pla093761
 for <openbmc@lists.ozlabs.org>; Tue, 14 Aug 2018 10:07:26 -0400
Received: from e34.co.us.ibm.com (e34.co.us.ibm.com [32.97.110.152])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2kuwybq6au-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 14 Aug 2018 10:07:25 -0400
Received: from localhost
 by e34.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <anoo@linux.ibm.com>;
 Tue, 14 Aug 2018 08:07:24 -0600
Received: from b03cxnp08025.gho.boulder.ibm.com (9.17.130.17)
 by e34.co.us.ibm.com (192.168.1.134) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 14 Aug 2018 08:07:20 -0600
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w7EE7J0X19792262
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 14 Aug 2018 07:07:19 -0700
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9A92F136051;
 Tue, 14 Aug 2018 08:07:19 -0600 (MDT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7E949136053;
 Tue, 14 Aug 2018 08:07:19 -0600 (MDT)
Received: from ltc.linux.ibm.com (unknown [9.16.170.189])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 14 Aug 2018 08:07:19 -0600 (MDT)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Tue, 14 Aug 2018 09:14:26 -0500
From: Adriana Kobylak <anoo@linux.ibm.com>
To: Emily Shaffer <emilyshaffer@google.com>
Cc: James Feist <james.feist@linux.intel.com>, openbmc@lists.ozlabs.org
Subject: Re: Read-Only IPMI sensors
In-Reply-To: <CAJoAoZnnt8qfH0H81phTZQdgwFM5KOZQjrrV6dQprWrD3-VgrQ@mail.gmail.com>
References: <6c913a75b11ae03ef9298085ead69afe@linux.vnet.ibm.com>
 <0cf6b440-e3d0-c1f1-48e9-f0cd6d4eff4f@linux.intel.com>
 <CAJoAoZnnt8qfH0H81phTZQdgwFM5KOZQjrrV6dQprWrD3-VgrQ@mail.gmail.com>
X-Sender: anoo@linux.ibm.com
User-Agent: Roundcube Webmail/1.0.1
X-TM-AS-GCONF: 00
x-cbid: 18081414-0016-0000-0000-0000091A2C44
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00009543; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000266; SDB=6.01073410; UDB=6.00553078; IPR=6.00853368; 
 MB=3.00022713; MTD=3.00000008; XFM=3.00000015; UTC=2018-08-14 14:07:23
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18081414-0017-0000-0000-00003FFECC97
Message-Id: <14bcd1ed07cdff6e5cc2fb2c49852a81@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-08-14_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1807170000 definitions=main-1808140145
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
X-List-Received-Date: Tue, 14 Aug 2018 14:07:30 -0000

On 2018-08-13 19:03, Emily Shaffer wrote:
> host-ipmid also already supports read-only, in fact, adding writable
> support was a pretty big work item last year. When you say data-driven
> design do you mean the automatic discovery? I guess I'm a little
> confused as to what exactly is missing for you.
> 

Yeah, by data-driven I mean the 
phosphor-ipmi-sensor-inventory%/config.yaml files in the openbmc repo 
where a sensor is matched to a D-Bus object. For example if we create a 
property under the Settings D-Bus object for the derating factor sensor, 
and add this object to the ipmi config.yaml file, a Set Sensor would be 
able to change its value, unless the host-ipmid read-only support 
prevents this. What is the read-only support in ipmi?

> On Mon, Aug 13, 2018 at 11:32 AM James Feist
> <james.feist@linux.intel.com> wrote:
> 
>> sdbusplus-asio already has support for read-only properties that
>> you
>> might be interested in using / duplicating:
>> 
> https://github.com/openbmc/sdbusplus/blob/master/sdbusplus/asio/object_server.hpp#L123
>> [2]
>> 

Thanks, will take a look, since we want read-only properties in 
sdbusplus regardless if they'll be used by ipmi.
