Return-Path: <ed.tanous@intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=192.55.52.151; helo=mga17.intel.com;
 envelope-from=ed.tanous@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41g3r52jL0zF14h
 for <openbmc@lists.ozlabs.org>; Wed,  1 Aug 2018 03:50:22 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 31 Jul 2018 10:50:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.51,428,1526367600"; d="scan'208";a="58622006"
Received: from hades.jf.intel.com (HELO [10.54.51.77]) ([10.54.51.77])
 by fmsmga007.fm.intel.com with ESMTP; 31 Jul 2018 10:49:59 -0700
Subject: Re: SSL Certificate management proposal.
To: Jayanth Othayoth <ojayanth@gmail.com>, openbmc@lists.ozlabs.org,
 bradleyb@fuzziesquirrel.com
References: <CACkAXSrxyf819dQc+LEOfwahpcrK2QRH1AkXump-D9Ae+yaKBQ@mail.gmail.com>
From: Ed Tanous <ed.tanous@intel.com>
Message-ID: <1d63a4ec-1902-c9d3-13d8-94ef7e437425@intel.com>
Date: Tue, 31 Jul 2018 10:51:27 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CACkAXSrxyf819dQc+LEOfwahpcrK2QRH1AkXump-D9Ae+yaKBQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
X-List-Received-Date: Tue, 31 Jul 2018 17:50:30 -0000

On 07/31/2018 07:49 AM, Jayanth Othayoth wrote:
> 
> The workflow for updating a signed certificate on the BMC consists of:
> 1. Generating a CSR on the BMC
> 2. Exporting the CSR from the BMC onto the user’s storage device
> 3. Obtaining a singed certificate corresponding to the CSR from a CA
> 4. Importing the signed certificate on the BMC
> 

This workflow is somewhat of a non starter for a lot of organizations 
and IT departments.  First, it requires that every BMC have its own 
private key, which isn't always desired.
Second, it means that you either have to be able to specify all 
parameters that a user would want to specify about his key (number of 
bits, EC vs RSA, ect).
Third, it requires that every BMC be provisioned by the intermediate 
authority, which can be difficult if keys either have a cost associated 
with them, or are difficult to acquire.

I would vote that we should start with the key and certificate upload 
flows, as they are far simpler to implement, and better understood in 
practice then try to go after the BMC CSR implementation if it's still 
required.

> 
> Additional Requirements:
> 
>   * BMC should store the Signed certificate and private key in a
>     persistent secured storage location..

What does this mean exactly?  Encrypted disk backed by hardware 
security?  Is it just implying file system permissions?

>   * Activate process shall validate the new certificate against the
>     private key and information in the CSR.
You don't really define what the "activate process" is in this context. 
I suspect you're talking about a process designed for cert upload, but 
I'm not really sure given the context.

>   * Successful certificate activation shall replace the existing
>     certificate and private key.
>   * A new CSR generate request will overwrite the previous CSR. User
>     should take caution to not repeat CSR requests to prevent
>     overwriting pending CSRs.

If you're going after a CSR flow, I don't think you can do this to a 
user.  Having a CSR immediately overwrite would mean that it invalidated 
the old one, and you have a period of time where your BMC interfaces are 
down while you request a new certificate from your intermediate authority.

>   * Certificate management operation should be restricted for certain
>     privilege levels.

Which privilege levels?  This requirement should be more specific.

>   * As part of Boot process,  a new self-signed certificate is generated if:
> 
>   * No CA signed certificate is present or corrupted.
>   * A self-signed certificate is not present or corrupted.

Agree with these two, and I believe this is how all the web clients 
currently work.

>   * The certificate has expired.
Disagree with this one.  If the certificate has expired AND it was a 
self signed cert, it could be replaced, but it doesn't happen much in 
practice, as self signed certs usually have a very long validity period 
(10 years or more).
If a certificate that a user has uploaded expired, it should be left 
expired until the user decides to replace it.  We shouldn't be changing 
keys and certificates seemingly randomly or automatically.
There's also a question of how you determine if a certificate is 
"expired".  There are no guarantees that the BMC clock is accurate at 
all times, and the potential race conditions in supporting this outweigh 
the benefit.

> 
>   * Validity of the certificate must be ensured by the user or client
>     application by periodically checking the expiry date. Certificate
>     management feature may be be enhanced in future to generate events
>     when the certificate is about to expire.
> 
>   * Existing REST session will be tossed during certificate activate
>     process.
I assume you mean restarted?  I would word this requirement a little 
differently.

* While the web services may restart to begin using the new certificate, 
it shall not interrupt any update flows, and return codes returned by 
all interfaces shall be correct.

> 
> 
> Note: REST/D-bus details not included here.
