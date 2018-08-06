Return-Path: <ed.tanous@intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=134.134.136.20; helo=mga02.intel.com;
 envelope-from=ed.tanous@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41krYh2rRqzDq6t
 for <openbmc@lists.ozlabs.org>; Tue,  7 Aug 2018 07:36:06 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 Aug 2018 14:36:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.51,452,1526367600"; d="scan'208";a="61091237"
Received: from hades.jf.intel.com (HELO [10.54.51.77]) ([10.54.51.77])
 by fmsmga008.fm.intel.com with ESMTP; 06 Aug 2018 14:32:15 -0700
Subject: Re: SSL Certificate management - proposed REST APIs
To: openbmc@lists.ozlabs.org
References: <mailman.863.1533082376.30117.openbmc@lists.ozlabs.org>
 <a38b7b7a-1947-bd45-49d2-31a6dc5113af@charter.net>
From: Ed Tanous <ed.tanous@intel.com>
Message-ID: <920ea60a-3594-f410-09a0-b29ed45f584b@intel.com>
Date: Mon, 6 Aug 2018 14:33:45 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <a38b7b7a-1947-bd45-49d2-31a6dc5113af@charter.net>
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
X-List-Received-Date: Mon, 06 Aug 2018 21:36:09 -0000

On 08/01/2018 06:40 AM, Joseph Reynolds wrote:
>> Message: 4
>> Date: Tue, 31 Jul 2018 20:19:38 +0530
>> From: Jayanth Othayoth <ojayanth@gmail.com>
>> To: openbmc@lists.ozlabs.org, bradleyb@fuzziesquirrel.com,
>> ed.tanous@intel.com
>> Subject: SSL Certificate management proposal.
>> Message-ID:
>> <CACkAXSrxyf819dQc+LEOfwahpcrK2QRH1AkXump-D9Ae+yaKBQ@mail.gmail.com>
>> Content-Type: text/plain; charset="utf-8"
>>
>> This proposal provides a mechanism to replace the self signed certificate
>> with  CA signed certificate based on BMC generated CSR.
>> [...snip...]
>>
>> How to update a signed certificate on the BMC ?
>> [...snip...]
>>
>> In order to support the above workflow, the BMC shall provide the 
>> following
>> REST APIs:
>>     [...snip...]
>>     - Upload digitally signed certificate.
>>     - Activate digitally signed certificates
>>     - Download digitally signed certificate
>> [...snip...]
>>
>> Note: REST/D-bus details not included here.
> 
> Straw-man proposal for SSL certificate REST APIs
> 
> URIs:
> /xyz/openbmc_project/certificates/ssl/{index}
>          Represents a SSL certificate
>          Supports GET, PUT, POST, DELETE
This endpoint really shouldn't support POST, as that would be a creation 
action.  You can't create an already created object, and we shouldn't 
really support creation of new certificate types at runtime.  GET is 
bad, because it implies that we allow download of the cert once it's on 
the BMC, which we shouldn't do.  I suspect this API should support PUT 
and possibly DELETE (to revert back to a self signed cert).


>          JSON { "certificate": "..." }
This field exist in a GET response.  Once uploaded, I don't think we 
should expose the key through any external interfaces.  You could do 
something similar to the redfish AccountService schema, where it 
specifies that that field (like password) will be nullptr on responses, 
but I'm not sure what value it provides.  Alternatively you could return 
some of the data fields that aren't considered secret (expiration date, 
common name, ect), but again, I'm not really sure how useful that is.

>      /xyz/openbmc_project/certificates/ssl/active
>          Represents which certificate is used by SSL
>          Supports GET, PUT, DELETE
>          JSON { "data": "/xyz/openbmc_project/certificates/ssl/1" }
>          See the magic below.

Why even support a collection and an activate?  Testing a REST 
collection is much more difficult than testing a single endpoint that 
allows uploading a key, and reduces the number of things you need to 
specify.  For example, how many certificates should we allow storing? 
Should we store them all in nonvolatile or temporal storage?  When a 
delete is issued, how do we ensure the unique id (1 in the above case) 
doesn't change?

An API like below seems a lot easier to understand and use

/xyz/openbmc_project/certificates/ssl
Supports PUT, DELETE
PUT JSON { "data": "<CERTIFICATE DATA>" }

POST would upload the certificate, verify it, and restart the webserver.
DELETE would remove the previously uploaded certificate and replace with 
the "default" certificate.  In the case of ssl, it would replace it with 
the self signed key.

> 
> Notes:
>   - These represent a collection of SSL certificates and optionally an 
> active one.
>   - The number of certificates can be zero or more.
Given some of the other requirements, should it ever be zero?  Shouldn't 
we always at least have a self signed cert?  Baring that, does the 
number of keys we support even change at runtime?  I suspect we can just 
come up with a list of well known names (ssl, ldap, ect) at compile 
time, and avoid the concept of uploading and naming certificates 
alltogether.

>   - The certificate numbering ({index}) must be stable across API 
> operations.
>   - The implementation can impose a maximum limit (16 is plenty?).
>   - Duplicate certificates are allowed and are not detected.
>   - Expired certificates are allowed and are not detected.
>   - Mal-formed certificates are detected? TODO
>   - The certificates and active certificate info persists across rebooting.
> 
If we removed the collection aspect, most of these requirements (and 
associated test cases) go away, and the interface becomes much easier to 
use.  I believe this is the path we should go down.

> Magic for the active SSL certificate:
>   - When SSL is started with no active certificate:
>      + A certificate is created and used to sign itself.
>      + The new certificate becomes the active certificate.
>      + TODO: What if you already have the maximum number of certificates 
> allowed?
>   - When you attempt to delete the active certificate:
>      + This is allowed.  TODO: Or maybe not allowed.
>      + There will be no active certificate (see implementation note).
>      + /xyz/openbmc_project/certificates/ssl/active is deleted.
>      + The underlying certificate is not deleted.
>   - When you PUT (replace) the active certificate:
>      + This is allowed.  TODO: Or maybe not allowed.
>      + The newly put certificate becomes active (see implementation note).
>      + /xyz/openbmc_project/certificates/ssl/active does not change.
> 
> Implementation note: When you change the active certificate while SSL is 
> running, does the behavior of SSL change immediately, or only for new 
> connections?  How does this work?  TODO.

I don't know of a way to persist TLS sessions on a key change, without 
keeping a second OpenSSL context around.  I suspect we need to complete 
the TLS session with the existing key (to give the uploader the correct 
response) then drain and close the connection pool, and restart the server.

> 
> Ideas to support future behaviors:
> 
> 1. To support future certificate types, the ssl element was used. Ideas:
>      /xyz/openbmc_project/certificates/ssl
>      /xyz/openbmc_project/certificates/host
>      /xyz/openbmc_project/certificates/rootoftrust

I like this, as it makes it very explicit what keys are supported to a 
user, although I suspect root of trust certificates will take a 
different form.

> 
> 2. There are two options to articulate the content of each certificate 
> (such as an associated private key or certificate signing request): JSON 
> and URIs:
> JSON:
>      { "certificate": "...", "privatekey": "...", "expiration": "DATE" }
> URIs:
>      /xyz/openbmc_project/certificates/ssl/1/certificate
>      /xyz/openbmc_project/certificates/ssl/1/privatekey
>      /xyz/openbmc_project/certificates/ssl/1/csr
Private key should never be hosted from an outbound interface.  Doing so 
defeats the entire purpose of generating the CSR on the bmc in the first 
case.  These APIs could be POST only, in which case it would be much 
better, but in that case, you don't necessarily need CSR.


> The JSON approach seems way easier.
> 
> 3. The URIs for certificate signing requests (CSR) could be:
> /xyz/openbmc_project/certificates/csr/{index}
>      /xyz/openbmc_project/certificates/ssl/csr
> /xyz/openbmc_project/certificates/ssl/csr/{index}
> depending on how many CSRs you wanted to support.  (But let's not debate 
> that now).
> 

:)  Can we debate 1 versus >1?  I don't know of any use cases that would 
require multiple CSRs per interface, and single CSR, with persistence 
until the next reboot is much easier to design and test than a multiple 
certificate store kept persistently.
