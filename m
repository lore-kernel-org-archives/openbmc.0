Return-Path: <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6129AC433EF
	for <openbmc@archiver.kernel.org>; Thu,  6 Jan 2022 18:28:21 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JVFGW3C1Yz30L4
	for <openbmc@archiver.kernel.org>; Fri,  7 Jan 2022 05:28:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default header.b=p7gfXlme;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.microsoft.com (client-ip=13.77.154.182;
 helo=linux.microsoft.com; envelope-from=dphadke@linux.microsoft.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com
 header.a=rsa-sha256 header.s=default header.b=p7gfXlme; 
 dkim-atps=neutral
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by lists.ozlabs.org (Postfix) with ESMTP id 4JVFFj0fBFz2yLK
 for <openbmc@lists.ozlabs.org>; Fri,  7 Jan 2022 05:27:36 +1100 (AEDT)
Received: from [192.168.87.64] (unknown [50.47.106.53])
 by linux.microsoft.com (Postfix) with ESMTPSA id A5B2C20B717A;
 Thu,  6 Jan 2022 10:27:02 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com A5B2C20B717A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1641493622;
 bh=JO3iKAMhL3gpITbYqTKFip+RRsLZFKesoV5G/+DcwTI=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=p7gfXlmexiTc3mHXR2Hv7j9ybs1nlh05GhKY8gauy1VjSARyePKi7GGRzYQUR/9sP
 Zjsp3NQZ9ETpbFZNmU+gqBUoEOmKGWpmxZvR2Ak/9iv4ykBchDoiVHycoecEWVBMUe
 UYHkzEYgdTN3N0fN1LxLK5e4i2OByRrlbul5qz00=
Message-ID: <7d816ae9-a1fb-8276-f389-e881162abc5d@linux.microsoft.com>
Date: Thu, 6 Jan 2022 10:27:03 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: Security Working Group meeting - Wednesday January 5 - results
Content-Language: en-US
To: Joseph Reynolds <jrey@linux.ibm.com>, "Mihm, James"
 <james.mihm@intel.com>, openbmc <openbmc@lists.ozlabs.org>
References: <d36d0990-7c00-bf7d-890b-82e12687d395@linux.ibm.com>
 <c25985ea-279f-ed71-7924-6cdcbd07b398@linux.ibm.com>
From: Dhananjay Phadke <dphadke@linux.microsoft.com>
In-Reply-To: <c25985ea-279f-ed71-7924-6cdcbd07b398@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

On 1/5/2022 2:29 PM, Joseph Reynolds wrote:
> 2 The OpenBMC security response team wants to use the github security 
> tabs, and is looking for best practices. 
> https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/50115 
> <https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/50115>
> 
> How can the OpenBMC SRT get authority to publish security advisories on 
> github? What are the best practices?  What repo should be used? 
> openbmc/openbmc?  openbmc/security-response?  A new repo 
> openbmc/security-advisories?
> 
> See 
> https://docs.github.com/en/organizations/managing-access-to-your-organizations-repositories/repository-roles-for-an-organization 
> <https://docs.github.com/en/organizations/managing-access-to-your-organizations-repositories/repository-roles-for-an-organization> 
> 

GitHub advisories documentation:

https://docs.github.com/en/code-security/security-advisories

Regards,
Dhananjay
