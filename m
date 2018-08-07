Return-Path: <joseph-reynolds@charter.net>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=charter.net
 (client-ip=68.114.190.28; helo=mtaout003-public.msg.strl.va.charter.net;
 envelope-from=joseph-reynolds@charter.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=charter.net
Received: from mtaout003-public.msg.strl.va.charter.net
 (mtaout003-public.msg.strl.va.charter.net [68.114.190.28])
 by lists.ozlabs.org (Postfix) with ESMTP id 41l3LJ36f9zDqBx
 for <openbmc@lists.ozlabs.org>; Tue,  7 Aug 2018 15:41:59 +1000 (AEST)
Received: from impout005 ([68.114.189.20]) by mtaout003.msg.strl.va.charter.net
 (InterMail vM.9.00.023.01 201-2473-194) with ESMTP
 id <20180807054154.NXPM7355.mtaout003.msg.strl.va.charter.net@impout005>
 for <openbmc@lists.ozlabs.org>; Tue, 7 Aug 2018 00:41:54 -0500
Received: from [192.168.2.6] ([97.86.254.207]) by impout005 with charter.net
 id L5ht1y00N4VFKzV015huNb; Tue, 07 Aug 2018 00:41:54 -0500
X-Authority-Analysis: v=2.2 cv=Ts+WvHfh c=1 sm=1 tr=0
 a=TxbYGM+zWkYih0pDanbSSw==:117 a=TxbYGM+zWkYih0pDanbSSw==:17
 a=IkcTkHD0fZMA:10 a=x7bEGLp0ZPQA:10 a=QyXUC8HyAAAA:8 a=voM4FWlXAAAA:8
 a=pGLkceISAAAA:8 a=tcme9c7lAAAA:8 a=As2Vix1I84EkInkO98oA:9
 a=7nfCDPB3aClNVwtK:21 a=UOpm6IUpDBsS5tog:21 a=QEXdDO2ut3YA:10
 a=IC2XNlieTeVoXbcui8wp:22 a=cJsI3S3cdgERF2JXxJch:22
X-Auth-id: am9zZXBoLXJleW5vbGRzQGNoYXJ0ZXIubmV0
Subject: Re: Re: SSL Certificate management - proposed REST APIs
To: openbmc@lists.ozlabs.org
References: <mailman.416.1533597083.2968.openbmc@lists.ozlabs.org>
From: Joseph Reynolds <joseph-reynolds@charter.net>
Message-ID: <2405db7e-2b5f-a8c4-9b1a-c33433110d90@charter.net>
Date: Tue, 7 Aug 2018 00:41:36 -0500
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <mailman.416.1533597083.2968.openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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
X-List-Received-Date: Tue, 07 Aug 2018 05:42:01 -0000

> Date: Mon, 6 Aug 2018 14:33:45 -0700
> From: Ed Tanous <ed.tanous@intel.com>
> To: openbmc@lists.ozlabs.org
> Subject: Re: SSL Certificate management - proposed REST APIs
> Message-ID: <920ea60a-3594-f410-09a0-b29ed45f584b@intel.com>
> Content-Type: text/plain; charset=utf-8; format=flowed
>
> On 08/01/2018 06:40 AM, Joseph Reynolds wrote:
>>> Message: 4
>>> Date: Tue, 31 Jul 2018 20:19:38 +0530
>>> From: Jayanth Othayoth <ojayanth@gmail.com>
>>> To: openbmc@lists.ozlabs.org, bradleyb@fuzziesquirrel.com,
>>> ed.tanous@intel.com
>>> Subject: SSL Certificate management proposal.
>>> Message-ID:
>>> <CACkAXSrxyf819dQc+LEOfwahpcrK2QRH1AkXump-D9Ae+yaKBQ@mail.gmail.com>
>>> Content-Type: text/plain; charset="utf-8"
>>>
>>> This proposal provides a mechanism to replace the self signed certificate
>>> with? CA signed certificate based on BMC generated CSR.
>>> [...snip...]
>>>
>>> How to update a signed certificate on the BMC ?
>>> [...snip...]
>>>
>>> In order to support the above workflow, the BMC shall provide the
>>> following
>>> REST APIs:
>>> ??? [...snip...]
>>> ??? - Upload digitally signed certificate.
>>> ??? - Activate digitally signed certificates
>>> ??? - Download digitally signed certificate
>>> [...snip...]
>>>
>>> Note: REST/D-bus details not included here.
>> Straw-man proposal for SSL certificate REST APIs
>>
>> URIs:
>> /xyz/openbmc_project/certificates/ssl/{index}
>>   ??? ??? Represents a SSL certificate
>>   ??? ??? Supports GET, PUT, POST, DELETE
> This endpoint really shouldn't support POST, as that would be a creation
> action.  You can't create an already created object, and we shouldn't
> really support creation of new certificate types at runtime.  GET is
> bad, because it implies that we allow download of the cert once it's on
> the BMC, which we shouldn't do.  I suspect this API should support PUT
> and possibly DELETE (to revert back to a self signed cert).
>
>
>>   ??? ??? JSON { "certificate": "..." }
> This field exist in a GET response.  Once uploaded, I don't think we
> should expose the key through any external interfaces.  You could do
> something similar to the redfish AccountService schema, where it
> specifies that that field (like password) will be nullptr on responses,
> but I'm not sure what value it provides.  Alternatively you could return
> some of the data fields that aren't considered secret (expiration date,
> common name, ect), but again, I'm not really sure how useful that is.
Good idea.

...snip...
> An API like below seems a lot easier to understand and use
> /xyz/openbmc_project/certificates/ssl
> Supports PUT, DELETE
> PUT JSON { "data": "<CERTIFICATE DATA>" }
>
> POST would upload the certificate, verify it, and restart the webserver.
> DELETE would remove the previously uploaded certificate and replace with
> the "default" certificate.  In the case of ssl, it would replace it with
> the self signed key.
Yes, PUT seems right.  (I assume you meant to use PUT consistently in 
the paragraph above.)
> Notes:
>   ?- These represent a collection of SSL certificates and optionally an
> active one.
>   ?- The number of certificates can be zero or more.
> Given some of the other requirements, should it ever be zero?  Shouldn't
Yes, the spec should allow for the certificate to not be there.  Can 
this happen when the BMC is being provisioned or decommissioned, after 
the cert is deleted and before it gets re-created (if SSL is not running 
but REST APIs are working), and possibly when processing a certificate 
signing request?
> we always at least have a self signed cert?  Baring that, does the
> number of keys we support even change at runtime?  I suspect we can just
> come up with a list of well known names (ssl, ldap, ect) at compile
> time, and avoid the concept of uploading and naming certificates
> alltogether.
Yes, I meant to specify a fixed list of well-known names: ssl, ldap, etc.

...snip...
> If we removed the collection aspect, most of these requirements (and
> associated test cases) go away, and the interface becomes much easier to
> use.  I believe this is the path we should go down.
That sounds good to me.  I was already trying to simplify some previous 
discussions. :-)

...snip...
>> Implementation note: When you change the active certificate while SSL is
>> running, does the behavior of SSL change immediately, or only for new
>> connections?? How does this work?? TODO.
> I don't know of a way to persist TLS sessions on a key change, without
> keeping a second OpenSSL context around.  I suspect we need to complete
> the TLS session with the existing key (to give the uploader the correct
> response) then drain and close the connection pool, and restart the server.
>
>> Ideas to support future behaviors:
>>
>> 1. To support future certificate types, the ssl element was used. Ideas:
>>   ??? /xyz/openbmc_project/certificates/ssl
>>   ??? /xyz/openbmc_project/certificates/host
>>   ??? /xyz/openbmc_project/certificates/rootoftrust
> I like this, as it makes it very explicit what keys are supported to a
> user, although I suspect root of trust certificates will take a
> different form.
>
>> 2. There are two options to articulate the content of each certificate
>> (such as an associated private key or certificate signing request): JSON
>> and URIs:
>> JSON:
>>   ??? { "certificate": "...", "privatekey": "...", "expiration": "DATE" }
>> URIs:
>>   ??? /xyz/openbmc_project/certificates/ssl/1/certificate
>>   ??? /xyz/openbmc_project/certificates/ssl/1/privatekey
>>   ??? /xyz/openbmc_project/certificates/ssl/1/csr
> Private key should never be hosted from an outbound interface.  Doing so
> defeats the entire purpose of generating the CSR on the bmc in the first
> case.  These APIs could be POST only, in which case it would be much
> better, but in that case, you don't necessarily need CSR.
>
>
>> The JSON approach seems way easier.
>>
>> 3. The URIs for certificate signing requests (CSR) could be:
>> /xyz/openbmc_project/certificates/csr/{index}
>>   ??? /xyz/openbmc_project/certificates/ssl/csr
>> /xyz/openbmc_project/certificates/ssl/csr/{index}
>> depending on how many CSRs you wanted to support.? (But let's not debate
>> that now).
>>
> :)  Can we debate 1 versus >1?  I don't know of any use cases that would
> require multiple CSRs per interface, and single CSR, with persistence
> until the next reboot is much easier to design and test than a multiple
> certificate store kept persistently.
Agreed.  1 CSR per interface is plenty.

It seems like there are increasingly complex use cases:
1. A Self-signed SSL certificate is created when there is no other 
certificate to use.  This is the current behavior.
2. Some other server creates a SSL certificate and causes it to be 
signed (either by a well known Certificate Authority or by acting as a 
CA), then PUTs that SSL certificate onto the BMC.
3. Information for the CSR is PUT onto the BMC which then chooses 
private keys, creates the SSL Certificate Signing Request (CSR), and 
causes the SSL certificate to be signed.  When the signed SSL 
certificate returns, the BMC uses it.
Does the information needed for the CSR need to be kept around for 
re-use?  Would the CSR itself ever be re-used?

It seems like having PUT /xyz/openbmc_project/certificates/ssl is the 
simplest way to provide use case 2.
