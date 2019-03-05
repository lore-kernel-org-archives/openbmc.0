Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::535; helo=mail-pg1-x535.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="bRD2fLJ8"; 
 dkim-atps=neutral
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com
 [IPv6:2607:f8b0:4864:20::535])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44DVHh6SvvzDqCw
 for <openbmc@lists.ozlabs.org>; Wed,  6 Mar 2019 08:23:27 +1100 (AEDT)
Received: by mail-pg1-x535.google.com with SMTP id r124so6522585pgr.3
 for <openbmc@lists.ozlabs.org>; Tue, 05 Mar 2019 13:23:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=T+oP5wNpUNxzT1/mKP2OdXQ6aqZQZjg7YxNPct+QCr8=;
 b=bRD2fLJ8UWcryZDtYD1Pzg2BJ6loi0IMg8lrcsbhDQ7YAd3QxsuJEvmkYG/XFaj/dz
 Yo1lw9TY52DC+9O369b96B8YBFPco/ZIljNLUIlIVoBG0dWz8yxn7ezdKz2Z22NWLC0O
 LssQ92xJkySSXTp5H5dw6mxwOi36eKJg0xN94dRlanrNooHNGnhSYVHW34KZUiUzWafm
 9lO8ZKujyVQOrOF3+RQgOkEmrEAe6OCJ//Gj79J2OOX5RaMJTxx9EWhVpdSAuUHn8OEa
 g/MhLAjAyV2dA1TfUib8QfugphBVRqehNOtcq+UIqxdqwvutEACyWLx8sYUNXafYJR77
 yvJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=T+oP5wNpUNxzT1/mKP2OdXQ6aqZQZjg7YxNPct+QCr8=;
 b=NAgfCwwB5VTFlhbZwWmxSx3J+aX+ZPs66KUZvSKJa17UjKbQ3PbItPZcxOESJxc0kT
 6YRK/+We4F6jXoa27NxAvOIuzkczk/2YwzDnmE1pzUu+9z79AMhjZj4Be449fRZx4jrG
 RoajLPwtbxSM5jRE02MOxNMRMV1eMz2JdtUlv+xEArDNIkRivaDWjMrJJlwaUGY8HXCL
 x/zY6GZMIclskw1mnaPl1tXLg5E6Cjtgp1o2XWsPTFn9gdWdA73NpNl+3uD/zFTQ7uo+
 yhMRHuOGITTjA1TMtf5YLgzJwjT9sXlJA+NHBKKjAu1aOPLKZtCoOkzZjzoCP3nPQ/VR
 aonA==
X-Gm-Message-State: APjAAAUypMW6EoJ7pSv18KSQ4eu4aw7UX01cWIEIcba4JhFCL+FNhqzr
 EW9q+94rzOumH3ZNBnzyc9rXjGH6vZstxl0UTRCklHfOYPw=
X-Google-Smtp-Source: APXvYqwr2g3y6kFIumqsdEgA9ZWz76zvrto+q54R2WTaUZHVjUXayuNzl/xfMcJb3hy/BeuZryWfMt//p/tr2sKOUaI=
X-Received: by 2002:a62:11c6:: with SMTP id 67mr3820089pfr.68.1551821003872;
 Tue, 05 Mar 2019 13:23:23 -0800 (PST)
MIME-Version: 1.0
References: <CAO=notzgE0XdR_paQsbzbS7jfoshdT=pti3kMZ0wObb7q6hU0g@mail.gmail.com>
 <CAO=notwZ0RX2WeqyEFgNBYYaYL_eMXjZzknpfwwGuanT1WpwrQ@mail.gmail.com>
In-Reply-To: <CAO=notwZ0RX2WeqyEFgNBYYaYL_eMXjZzknpfwwGuanT1WpwrQ@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Tue, 5 Mar 2019 13:23:12 -0800
Message-ID: <CAO=notwHkTs1NhWLOu22vjcQuXkOaHOAi1A7ZodgtPFKkNfkdQ@mail.gmail.com>
Subject: Re: new repo request
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Kun Yi <kunyi731@gmail.com>, 
 Natarajan Gurumoorthy <natg@google.com>,
 Benjamin Fair <benjaminfair@google.com>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Tue, 05 Mar 2019 21:23:30 -0000

On Mon, Mar 4, 2019 at 11:33 AM Patrick Venture <venture@google.com> wrote:
>
> On Mon, Mar 4, 2019 at 10:12 AM Patrick Venture <venture@google.com> wrote:
> >
> > Brad,
> >
> > Please create a repo: ipmi-blob-tool (or) phosphor-blob-tool (at your
> > discretion).
>
> This codebase is meant to run on the host and not the BMC, but will be
> specifically used by other host-tools talking to OpenBMC.
>
> >
> > I'm going to write up the blob tool as a library and then a small
> > utility, and then use that in phosphor-ipmi-flash so that we can have
> > other blob tools more easily.  There are a few other use-cases we've
> > run into, and the core blob code for the tool currently lives in
> > phosphor-ipmi-flash, which is sub-ideal.
> >
> > Patrick

Thanks!
