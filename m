Return-Path: <joel.stan@gmail.com>
Received: from mail-qk0-x243.google.com (mail-qk0-x243.google.com
 [IPv6:2607:f8b0:400d:c09::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rN3fc455qzDq7w
 for <openbmc@lists.ozlabs.org>; Mon,  6 Jun 2016 02:47:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=VS7iphme; 
 dkim=pass (1024-bit key;
 unprotected) header.d=jms.id.au header.i=@jms.id.au header.b=VEzP0DWE; 
 dkim-atps=neutral
Received: by mail-qk0-x243.google.com with SMTP id u63so1985204qkh.0
 for <openbmc@lists.ozlabs.org>; Sun, 05 Jun 2016 09:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=EkGsab2TfBVhWZ0jQYiEEQvul/KGifIGWLXPPbF2l48=;
 b=VS7iphmevau1t4gfQaM0hRVGhI7tMkIBeszvk8zKcigLa1HAon9m2RpJPI2Z0thSDa
 hm9p3aV20I4T/2uilX/Y1Yi2uZBXR+1gyJr7Cgq22sWYED8Dt0/hpKeAsq/W8kZCGkdp
 LFYKLwjr5QogcHpczGv87rWvg/cwNR2tyjfcnwSnKWafNE9GeIqyx8O6PB19Q4ZwkG3k
 icp7DQ6EKvEwHhMsO4eMqNkWafOsXJugSBBnmYY1XXJz9NUBd9W3wdYSTNxxsgN4U1Nf
 Nvb/fwNe4reu2LqMGSBZsAjbC9fzO7FVaq5yW8Rd6Voyi0q2aFjzv0cg+wZi8hQDbF5B
 k98A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=EkGsab2TfBVhWZ0jQYiEEQvul/KGifIGWLXPPbF2l48=;
 b=VEzP0DWEnVnNLaf2KOgEsGV1N+OBrkYfWUaxc1BeTZuwIJ7k6wSfOi4IR4FlqdPyKE
 3GI7pZQtFvUBx2ozxNiyHMPUrLRfuX9rMxHIngMtypYuJI1Wkb5cSUjANq8NV8KqDAq8
 rM+Irte8OazC7OWmA1dsRz0E2UnvjkciYulRU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=EkGsab2TfBVhWZ0jQYiEEQvul/KGifIGWLXPPbF2l48=;
 b=mMfXu5xwr59mAfjLzSHhsHy/XPDkJnQwGK0LGspCIBrsbTYBQjqdmbMV8FV/PTWDKB
 4KCrxQAtow9Py9oUfggdViCjkx4+SY+94YhytJNvLlGX39KfwAhjFm0CAdT5IY57YGT+
 Qx8cfZXPU12ilkpyKvqmNj+m4yeH9Lz/+2odzYKdQ3+PT4ML2wNkmOLngevh9MzcZyUT
 BrmRnMGIfvBlWKF6YKEqtAXhfct14g5EjaSbSXdFCKc0ZWo9xsA/lfQBLsEgcKXROoxh
 VoSBOw1Cr6nvwtTHkEtY8bnmJLE/7PG/WtiKCNUsHZdeRLKgrIqcFD1c1NtzNfQKdLF8
 rWNw==
X-Gm-Message-State: ALyK8tLtl+vK7JO4YYV7ueihu7k5kEP9zHy1HQ2MCzKMgAolbFwW3gwfzffhUHozXdBq56dPd2eN9wLvo1nF4g==
X-Received: by 10.55.147.196 with SMTP id v187mr12225862qkd.7.1465145270192;
 Sun, 05 Jun 2016 09:47:50 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.237.44.196 with HTTP; Sun, 5 Jun 2016 09:47:30 -0700 (PDT)
In-Reply-To: <20160604052039.6581-8-openbmc-patches@stwcx.xyz>
References: <20160604052039.6581-1-openbmc-patches@stwcx.xyz>
 <20160604052039.6581-8-openbmc-patches@stwcx.xyz>
From: Joel Stanley <joel@jms.id.au>
Date: Sun, 5 Jun 2016 11:47:30 -0500
X-Google-Sender-Auth: 4mMEHWGg55otWvWs4rxah-3kRVQ
Message-ID: <CACPK8XfZ2NgsF3pFejL8KgoByz2n68Cbtctrn_rXOWYFktPtfA@mail.gmail.com>
Subject: Re: [PATCH openbmc 07/10] Add a kernel 4.6 recipe
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>
Content-Type: text/plain; charset=UTF-8
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Sun, 05 Jun 2016 16:47:53 -0000

On Sat, Jun 4, 2016 at 12:20 AM, OpenBMC Patches
<openbmc-patches@stwcx.xyz> wrote:
> From: Brad Bishop <bradleyb@fuzziesquirrel.com>
>
> Adding a 4.6 kernel recipe for the AST2500.  AST2400 remains on
> 4.4.

We discussed this on IRC with Rick from Google. He would prefer us to
base the images on a released kernel, so we're what was my dev-4.7
tree rebased back down to 4.6.

The downside here is we now have three trees - 4.4 for the ast2400,
4.6 for the 2500 (but support is incomplete for eg. ftgmac100), and
4.7 for bringup and development.

I intend to clean up the 4.6 patchset and ensure it supports the
ast2500 and ast2400, and we will move to that. This way 4.6 can be our
stable tree, and I will continue to hack on 4.7-rc for bringup.

Once 4.7 is released we will move to that as our stable tree. The plan
is too keep in sync with upstream kernel releases at least until we
have the majority of our patches upstream. At that point we can pick a
long term supported kernel release and stick with that for some time.

This is a similar model that we have been using for the OpenPower
firmware and it is a nice balance between modern supported kernels and
managing workload.

> Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
> ---
>  meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.6.bb | 5 +++++
>  1 file changed, 5 insertions(+)
>  create mode 100644 meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.6.bb
>
> diff --git a/meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.6.bb b/meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.6.bb
> new file mode 100644
> index 0000000..b3891f4
> --- /dev/null
> +++ b/meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.6.bb
> @@ -0,0 +1,5 @@
> +KBRANCH ?= "dev-4.6"
> +LINUX_VERSION ?= "4.6"
> +SRCREV="e377df455809d87488eed132b41583ead909f58a"

I'd prefer we point to a tag, so if we chose to rebase the kernel the
commit will not disappear.

I'll push a tag for you to use.

Cheers,

Joel
