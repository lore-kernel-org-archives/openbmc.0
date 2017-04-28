Return-Path: <joel.stan@gmail.com>
Received: from mail-yb0-x232.google.com (mail-yb0-x232.google.com
 [IPv6:2607:f8b0:4002:c09::232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wDb2j5XlxzDqBQ
 for <openbmc@lists.ozlabs.org>; Fri, 28 Apr 2017 10:55:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="lQ1osj8/"; 
 dkim-atps=neutral
Received: by mail-yb0-x232.google.com with SMTP id 11so12143745yby.0
 for <openbmc@lists.ozlabs.org>; Thu, 27 Apr 2017 17:55:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=6adsH/K0JtD0jq5wGjqsyiNz01YXhUe1rSj054YWS6I=;
 b=lQ1osj8/9fgvSVm8yUprOwzRzxKqcbeO1ejUmXQjy0pt7hrnH5RtmRJcLD0jgdtnzS
 seMN8Tgk+yxapw2BcaqrvzmAKEDt96t2/63misufRdPCap9sEcnnysENuN/Eoo3FiztI
 De8eWS9WBEFL1TQeQGc5nzEXhX+rAva67GgkaQ0UfpuLUH+aAGy7RwjsJE9sOMH6Cd3a
 Rx9w3Qn4CVu+FAyj+SMBvIkR33wKpmOmrGBOL9W/OrPj/RSHz/+S6wLodewkj371ww5c
 IJg+gJa7euRguHdZgVvZGYRDI1b37ZcpmLwINAs69lydD8YLdwGzwvg0znnCYtgP3fOX
 ljUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=6adsH/K0JtD0jq5wGjqsyiNz01YXhUe1rSj054YWS6I=;
 b=s6kJDOTsqEVqOrfor0Hg9hUuYCgRJ38sR9iyp9Df4wsCfGTj/3RBTd500A/Fc8s8cO
 5kzmj1RvcgfMpQEKI0LvKKjCFRAScTFVSnUshUKz+oXT9alGxqlUGDjUajMAFRObKiVv
 S7kPhCky0wnNMYcnE+6vR7eMnYS+R1mVKX0TO7/5pHwneVENGVGSMsjUX8MNjZCY1gFN
 dKE7LRUWyvR6l4jVvCuioH+fA/LDdcwGfa15hoBykd6BzN7/elscqy3jfxKoCAq6VFxx
 D3tPeANMvULKh7ni13LLVD4kFCPNVEFJIODFrlfximK57F73tjz+YOuU/LcKBFvVI2bS
 VRow==
X-Gm-Message-State: AN3rC/7r1nF0jOCioOD/tDUf90j4SMH1/YfPMaVcGG5e/pdn4R2Yn4+Q
 7jGFrcNKiGwQKIGJtM0MBG7IlOhxiQ==
X-Received: by 10.37.164.101 with SMTP id f92mr3589969ybi.152.1493340923446;
 Thu, 27 Apr 2017 17:55:23 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.171.70 with HTTP; Thu, 27 Apr 2017 17:55:02 -0700 (PDT)
In-Reply-To: <20170427060823.32226-9-andrew@aj.id.au>
References: <20170427060823.32226-1-andrew@aj.id.au>
 <20170427060823.32226-9-andrew@aj.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 28 Apr 2017 10:25:02 +0930
X-Google-Sender-Auth: ZOpGzjP9iJ7OFxDgog0mex6p5xQ
Message-ID: <CACPK8XdkYe35Z21qmB0MYPx3ofqrOJcfwZa2o4wJ6t75m2VQZA@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10 08/10] aspeed: witherspoon: Remove
 LPC-to-AHB bridge configuration
To: Andrew Jeffery <andrew@aj.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Lei YU <mine260309@gmail.com>, Rick Altherr <raltherr@google.com>,
 Xo Wang <xow@google.com>
Content-Type: text/plain; charset=UTF-8
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 28 Apr 2017 00:55:26 -0000

On Thu, Apr 27, 2017 at 3:38 PM, Andrew Jeffery <andrew@aj.id.au> wrote:
> This is handled by the mbox daemon via the lpc-ctrl driver.
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

Applied to dev-4.10.

Cheers,

Joel
