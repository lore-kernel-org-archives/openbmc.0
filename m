Return-Path: <ed.tanous@intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=134.134.136.31; helo=mga06.intel.com;
 envelope-from=ed.tanous@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 439kf72cvZzDrPw
 for <openbmc@lists.ozlabs.org>; Fri,  7 Dec 2018 05:29:31 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 Dec 2018 10:29:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,323,1539673200"; 
 d="scan'208,217";a="105432138"
Received: from hades.jf.intel.com (HELO [10.54.51.78]) ([10.54.51.78])
 by fmsmga007.fm.intel.com with ESMTP; 06 Dec 2018 10:29:26 -0800
Subject: Re: New repo request: phosphor-ipmi-blobs-skm
To: openbmc@lists.ozlabs.org
References: <CAGMNF6VE0JaN93hZT5_PNYgu-inpx5JTWk4NhpS6=VuBuxpEzA@mail.gmail.com>
From: Ed Tanous <ed.tanous@intel.com>
Message-ID: <012da767-1f7c-6bff-ad47-afaa352b8242@intel.com>
Date: Thu, 6 Dec 2018 10:31:25 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <CAGMNF6VE0JaN93hZT5_PNYgu-inpx5JTWk4NhpS6=VuBuxpEzA@mail.gmail.com>
Content-Type: multipart/alternative;
 boundary="------------F43B5BADF5AEFE0BBAD56B3B"
Content-Language: en-US
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
X-List-Received-Date: Thu, 06 Dec 2018 18:29:36 -0000

This is a multi-part message in MIME format.
--------------F43B5BADF5AEFE0BBAD56B3B
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Can you go into a little more details on what this repository would do? 
A quick google of "storage key management" didn't really turn up much in
terms of specifics.  Is there a spec or design doc you could point us at?

Some initial questions I have (assuming this repo relates to key management)

1. How would this repository relate to phosphor-certificate-manager? 
Reimplementation of the same interface?  Different?  What are the major
differences that would warrant not simply putting the implementation
there?  Some of my confusion here is that phosphor-certificate-manager
has an implementation that can store certificates and private keys, and
has gone through many rounds of review on the interfaces.  I'm worried
that another key manager would simply be duplicating functionality that
already exists (although I hope not).

2. What interfaces and workflows would this implementation support? 
What does this implementation let us do that we can't do already?

3. When you say the storage format is SKM specific, what does that mean?

-Ed

On 12/6/18 10:19 AM, Kun Yi wrote:
> Hi Brad,
>
> May I request a new repository: phosphor-ipmi-blobs-skm?
>
> It is a phosphor-ipmi-blobs[1] based handler that supports simple
> binary data read/write/enumerate operations from the host to a storage
> only visible to BMC. Google uses it for storing Storage Key Management
> (SKM) specific binary data, and it may probably belong to the openBMC
> customizations that Google want to publish and permit others to use.
>
> Currently the storage format is skm specific, but it could be expanded
> to support other use cases, thus the "phosphor" naming. If you feel
> that it is still Google-specific, then "google-ipmi-blobs-skm" is
> acceptable as well. We can always rename this later if the use cases
> expand. =)
>
> Please add myself, Benjamin Fair (benjaminfair@google.com
> <mailto:benjaminfair@google.com>), and Patrick Venture
> (venture@google.com <mailto:venture@google.com>) as maintainers. Thanks!
>
> [1] https://github.com/openbmc/phosphor-ipmi-blobs
> -- 
> Regards,
> Kun

--------------F43B5BADF5AEFE0BBAD56B3B
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>Can you go into a little more details on what this repository
      would do?  A quick google of "storage key management" didn't
      really turn up much in terms of specifics.  Is there a spec or
      design doc you could point us at?</p>
    <p>Some initial questions I have (assuming this repo relates to key
      management)<br>
    </p>
    <p>1. How would this repository relate to
      phosphor-certificate-manager?  Reimplementation of the same
      interface?  Different?  What are the major differences that would
      warrant not simply putting the implementation there?  Some of my
      confusion here is that phosphor-certificate-manager has an
      implementation that can store certificates and private keys, and
      has gone through many rounds of review on the interfaces.  I'm
      worried that another key manager would simply be duplicating
      functionality that already exists (although I hope not).<br>
    </p>
    <p>2. What interfaces and workflows would this implementation
      support?  What does this implementation let us do that we can't do
      already?</p>
    <p>3. When you say the storage format is SKM specific, what does
      that mean?<br>
    </p>
    <div class="moz-cite-prefix">-Ed<br>
    </div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">On 12/6/18 10:19 AM, Kun Yi wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAGMNF6VE0JaN93hZT5_PNYgu-inpx5JTWk4NhpS6=VuBuxpEzA@mail.gmail.com">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <div dir="ltr">
        <div dir="ltr">Hi Brad,
          <div><br>
          </div>
          <div>May I request a new repository: phosphor-ipmi-blobs-skm?</div>
          <div><br>
          </div>
          <div>It is a phosphor-ipmi-blobs[1] based handler that
            supports simple binary data read/write/enumerate operations
            from the host to a storage only visible to BMC. Google uses
            it for storing Storage Key Management (SKM) specific binary
            data, and it may probably belong to the openBMC
            customizations that Google want to publish and permit others
            to use.</div>
          <div><br>
          </div>
          <div>Currently the storage format is skm specific, but it
            could be expanded to support other use cases, thus the
            "phosphor" naming. If you feel that it is still
            Google-specific, then "google-ipmi-blobs-skm" is acceptable
            as well. We can always rename this later if the use cases
            expand. =)</div>
          <div><br>
          </div>
          <div>Please add myself, Benjamin Fair (<a
              href="mailto:benjaminfair@google.com"
              moz-do-not-send="true">benjaminfair@google.com</a>), and
            Patrick Venture (<a href="mailto:venture@google.com"
              moz-do-not-send="true">venture@google.com</a>) as
            maintainers. Thanks!</div>
          <div>
            <div><br>
            </div>
            <div>[1] <a
                href="https://github.com/openbmc/phosphor-ipmi-blobs"
                moz-do-not-send="true">https://github.com/openbmc/phosphor-ipmi-blobs</a></div>
            -- <br>
            <div dir="ltr" class="gmail_signature">
              <div dir="ltr">Regards,
                <div>Kun</div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </blockquote>
  </body>
</html>

--------------F43B5BADF5AEFE0BBAD56B3B--
