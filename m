Return-Path: <joseph-reynolds@charter.net>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=charter.net
 (client-ip=68.114.190.29; helo=mtaout004-public.msg.strl.va.charter.net;
 envelope-from=joseph-reynolds@charter.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=charter.net
Received: from mtaout004-public.msg.strl.va.charter.net
 (mtaout004-public.msg.strl.va.charter.net [68.114.190.29])
 by lists.ozlabs.org (Postfix) with ESMTP id 41gZFm5dVSzF10S
 for <openbmc@lists.ozlabs.org>; Wed,  1 Aug 2018 23:40:59 +1000 (AEST)
Received: from impout002 ([68.114.189.17]) by mtaout004.msg.strl.va.charter.net
 (InterMail vM.9.00.023.01 201-2473-194) with ESMTP
 id <20180801134057.AQG3685.mtaout004.msg.strl.va.charter.net@impout002>
 for <openbmc@lists.ozlabs.org>; Wed, 1 Aug 2018 08:40:57 -0500
Received: from [192.168.2.6] ([97.86.254.207]) by impout002 with charter.net
 id Hpgw1y00F4VFKzV01pgw40; Wed, 01 Aug 2018 08:40:57 -0500
X-Authority-Analysis: v=2.2 cv=C6eZ8UH+ c=1 sm=1 tr=0
 a=TxbYGM+zWkYih0pDanbSSw==:117 a=TxbYGM+zWkYih0pDanbSSw==:17
 a=x7bEGLp0ZPQA:10 a=r77TgQKjGQsHNAKrUKIA:9 a=pGLkceISAAAA:8 a=voM4FWlXAAAA:8
 a=tcme9c7lAAAA:8 a=QyXUC8HyAAAA:8 a=CmcmwDZkHsnzOA0itmEA:9
 a=m-l6xdOEOEeLxD-J:21 a=IaDWHJMu3RXH-zQ6:21 a=QEXdDO2ut3YA:10
 a=jXvLrVMFqYS73pEZLKcA:9 a=Xdq1ro-6cCzpOw-Q:21 a=_Zx-MCLZG_tiU9V2:21
 a=1GojHl5rJC6sIRDL:21 a=_W_S_7VecoQA:10 a=IC2XNlieTeVoXbcui8wp:22
 a=cJsI3S3cdgERF2JXxJch:22
X-Auth-id: am9zZXBoLXJleW5vbGRzQGNoYXJ0ZXIubmV0
Subject: Re: SSL Certificate management - proposed REST APIs
To: openbmc@lists.ozlabs.org
References: <mailman.863.1533082376.30117.openbmc@lists.ozlabs.org>
From: Joseph Reynolds <joseph-reynolds@charter.net>
Message-ID: <a38b7b7a-1947-bd45-49d2-31a6dc5113af@charter.net>
Date: Wed, 1 Aug 2018 08:40:51 -0500
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <mailman.863.1533082376.30117.openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative;
 boundary="------------E0CF41C4066B1CC5B8A8D362"
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
X-List-Received-Date: Wed, 01 Aug 2018 13:41:02 -0000

This is a multi-part message in MIME format.
--------------E0CF41C4066B1CC5B8A8D362
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

> Message: 4
> Date: Tue, 31 Jul 2018 20:19:38 +0530
> From: Jayanth Othayoth <ojayanth@gmail.com>
> To: openbmc@lists.ozlabs.org, bradleyb@fuzziesquirrel.com,
> ed.tanous@intel.com
> Subject: SSL Certificate management proposal.
> Message-ID:
> <CACkAXSrxyf819dQc+LEOfwahpcrK2QRH1AkXump-D9Ae+yaKBQ@mail.gmail.com>
> Content-Type: text/plain; charset="utf-8"
>
> This proposal provides a mechanism to replace the self signed certificate
> with  CA signed certificate based on BMC generated CSR.
> [...snip...]
>
> How to update a signed certificate on the BMC ?
> [...snip...]
>
> In order to support the above workflow, the BMC shall provide the 
> following
> REST APIs:
>     [...snip...]
>     - Upload digitally signed certificate.
>     - Activate digitally signed certificates
>     - Download digitally signed certificate
> [...snip...]
>
> Note: REST/D-bus details not included here.

Straw-man proposal for SSL certificate REST APIs

URIs:
/xyz/openbmc_project/certificates/ssl/{index}
         Represents a SSL certificate
         Supports GET, PUT, POST, DELETE
         JSON { "certificate": "..." }
     /xyz/openbmc_project/certificates/ssl/active
         Represents which certificate is used by SSL
         Supports GET, PUT, DELETE
         JSON { "data": "/xyz/openbmc_project/certificates/ssl/1" }
         See the magic below.

Notes:
  - These represent a collection of SSL certificates and optionally an 
active one.
  - The number of certificates can be zero or more.
  - The certificate numbering ({index}) must be stable across API 
operations.
  - The implementation can impose a maximum limit (16 is plenty?).
  - Duplicate certificates are allowed and are not detected.
  - Expired certificates are allowed and are not detected.
  - Mal-formed certificates are detected? TODO
  - The certificates and active certificate info persists across rebooting.

Magic for the active SSL certificate:
  - When SSL is started with no active certificate:
     + A certificate is created and used to sign itself.
     + The new certificate becomes the active certificate.
     + TODO: What if you already have the maximum number of certificates 
allowed?
  - When you attempt to delete the active certificate:
     + This is allowed.  TODO: Or maybe not allowed.
     + There will be no active certificate (see implementation note).
     + /xyz/openbmc_project/certificates/ssl/active is deleted.
     + The underlying certificate is not deleted.
  - When you PUT (replace) the active certificate:
     + This is allowed.  TODO: Or maybe not allowed.
     + The newly put certificate becomes active (see implementation note).
     + /xyz/openbmc_project/certificates/ssl/active does not change.

Implementation note: When you change the active certificate while SSL is 
running, does the behavior of SSL change immediately, or only for new 
connections?  How does this work?  TODO.

Ideas to support future behaviors:

1. To support future certificate types, the ssl element was used. Ideas:
     /xyz/openbmc_project/certificates/ssl
     /xyz/openbmc_project/certificates/host
     /xyz/openbmc_project/certificates/rootoftrust

2. There are two options to articulate the content of each certificate 
(such as an associated private key or certificate signing request): JSON 
and URIs:
JSON:
     { "certificate": "...", "privatekey": "...", "expiration": "DATE" }
URIs:
     /xyz/openbmc_project/certificates/ssl/1/certificate
     /xyz/openbmc_project/certificates/ssl/1/privatekey
     /xyz/openbmc_project/certificates/ssl/1/csr
The JSON approach seems way easier.

3. The URIs for certificate signing requests (CSR) could be:
/xyz/openbmc_project/certificates/csr/{index}
     /xyz/openbmc_project/certificates/ssl/csr
/xyz/openbmc_project/certificates/ssl/csr/{index}
depending on how many CSRs you wanted to support.  (But let's not debate 
that now).


--------------E0CF41C4066B1CC5B8A8D362
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <blockquote type="cite" style="color: #000000;">Message: 4
      <br>
      Date: Tue, 31 Jul 2018 20:19:38 +0530
      <br>
      From: Jayanth Othayoth <a class="moz-txt-link-rfc2396E"
        href="mailto:ojayanth@gmail.com">&lt;ojayanth@gmail.com&gt;</a>
      <br>
      To: <a class="moz-txt-link-abbreviated"
        href="mailto:openbmc@lists.ozlabs.org">openbmc@lists.ozlabs.org</a>,
      <a class="moz-txt-link-abbreviated"
        href="mailto:bradleyb@fuzziesquirrel.com">bradleyb@fuzziesquirrel.com</a>,
      <br>
          <a class="moz-txt-link-abbreviated"
        href="mailto:ed.tanous@intel.com">ed.tanous@intel.com</a>
      <br>
      Subject: SSL Certificate management proposal.
      <br>
      Message-ID:
      <br>
          <a class="moz-txt-link-rfc2396E"
href="mailto:CACkAXSrxyf819dQc+LEOfwahpcrK2QRH1AkXump-D9Ae+yaKBQ@mail.gmail.com">&lt;CACkAXSrxyf819dQc+LEOfwahpcrK2QRH1AkXump-D9Ae+yaKBQ@mail.gmail.com&gt;</a>
      <br>
      Content-Type: text/plain; charset="utf-8"
      <br>
      <br>
      This proposal provides a mechanism to replace the self signed
      certificate
      <br>
      with  CA signed certificate based on BMC generated CSR.
      <br>
      [...snip...]
      <br>
      <br>
      How to update a signed certificate on the BMC ?
      <br>
      [...snip...]
      <br>
      <br>
      In order to support the above workflow, the BMC shall provide the
      following
      <br>
      REST APIs:
      <br>
          [...snip...]
      <br>
          - Upload digitally signed certificate.
      <br>
          - Activate digitally signed certificates
      <br>
          - Download digitally signed certificate
      <br>
      [...snip...]
      <br>
      <br>
      Note: REST/D-bus details not included here.
      <br>
    </blockquote>
    <br>
    Straw-man proposal for SSL certificate REST APIs
    <br>
    <br>
    URIs:
    <br>
        <i class="moz-txt-slash"><span class="moz-txt-tag">/</span>xyz/openbmc_project/certificates/ssl<span
        class="moz-txt-tag">/</span></i>{index}
    <br>
            Represents a SSL certificate
    <br>
            Supports GET, PUT, POST, DELETE
    <br>
            JSON { "certificate": "..." }
    <br>
        /xyz/openbmc_project/certificates/ssl/active
    <br>
            Represents which certificate is used by SSL
    <br>
            Supports GET, PUT, DELETE
    <br>
            JSON { "data": "/xyz/openbmc_project/certificates/ssl/1" }
    <br>
            See the magic below.
    <br>
    <br>
    Notes:
    <br>
     - These represent a collection of SSL certificates and optionally
    an active one.
    <br>
     - The number of certificates can be zero or more.
    <br>
     - The certificate numbering ({index}) must be stable across API
    operations.
    <br>
     - The implementation can impose a maximum limit (16 is plenty?).
    <br>
     - Duplicate certificates are allowed and are not detected.
    <br>
     - Expired certificates are allowed and are not detected.
    <br>
     - Mal-formed certificates are detected? TODO
    <br>
     - The certificates and active certificate info persists across
    rebooting.
    <br>
    <br>
    Magic for the active SSL certificate:
    <br>
     - When SSL is started with no active certificate:
    <br>
        + A certificate is created and used to sign itself.
    <br>
        + The new certificate becomes the active certificate.
    <br>
        + TODO: What if you already have the maximum number of
    certificates allowed?
    <br>
     - When you attempt to delete the active certificate:
    <br>
        + This is allowed.  TODO: Or maybe not allowed.
    <br>
        + There will be no active certificate (see implementation note).
    <br>
        + /xyz/openbmc_project/certificates/ssl/active is deleted.
    <br>
        + The underlying certificate is not deleted.
    <br>
     - When you PUT (replace) the active certificate:
    <br>
        + This is allowed.  TODO: Or maybe not allowed.
    <br>
        + The newly put certificate becomes active (see implementation
    note).
    <br>
        + /xyz/openbmc_project/certificates/ssl/active does not change.
    <br>
    <br>
    Implementation note: When you change the active certificate while
    SSL is running, does the behavior of SSL change immediately, or only
    for new connections?  How does this work?  TODO.
    <br>
    <br>
    Ideas to support future behaviors:
    <br>
    <br>
    1. To support future certificate types, the ssl element was used.
    Ideas:
    <br>
        /xyz/openbmc_project/certificates/ssl
    <br>
        /xyz/openbmc_project/certificates/host
    <br>
        /xyz/openbmc_project/certificates/rootoftrust
    <br>
    <br>
    2. There are two options to articulate the content of each
    certificate (such as an associated private key or certificate
    signing request): JSON and URIs:
    <br>
    JSON:
    <br>
        { "certificate": "...", "privatekey": "...", "expiration":
    "DATE" }
    <br>
    URIs:
    <br>
        /xyz/openbmc_project/certificates/ssl/1/certificate
    <br>
        /xyz/openbmc_project/certificates/ssl/1/privatekey
    <br>
        /xyz/openbmc_project/certificates/ssl/1/csr
    <br>
    The JSON approach seems way easier.
    <br>
    <br>
    3. The URIs for certificate signing requests (CSR) could be:
    <br>
        <i class="moz-txt-slash"><span class="moz-txt-tag">/</span>xyz/openbmc_project/certificates/csr<span
        class="moz-txt-tag">/</span></i>{index}
    <br>
        /xyz/openbmc_project/certificates/ssl/csr
    <br>
        <i class="moz-txt-slash"><span class="moz-txt-tag">/</span>xyz/openbmc_project/certificates/ssl/csr<span
        class="moz-txt-tag">/</span></i>{index}
    <br>
    depending on how many CSRs you wanted to support.  (But let's not
    debate that now).
    <br>
    <br>
  </body>
</html>

--------------E0CF41C4066B1CC5B8A8D362--
