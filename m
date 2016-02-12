Return-Path: <dja@axtens.net>
Received: from mail-pf0-x241.google.com (mail-pf0-x241.google.com
 [IPv6:2607:f8b0:400e:c00::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id B392B1A002B
 for <openbmc@lists.ozlabs.org>; Fri, 12 Feb 2016 23:48:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.b=NrbhBJY0; 
 dkim-atps=neutral
Received: by mail-pf0-x241.google.com with SMTP id c10so3959611pfc.0
 for <openbmc@lists.ozlabs.org>; Fri, 12 Feb 2016 04:48:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:subject:in-reply-to:references:user-agent:date:message-id
 :mime-version:content-type;
 bh=qNnyMKrll/R9ncgJlqHRTPxntS4V5kHGH9b3dXQQHFI=;
 b=NrbhBJY0FjTwAzD+/VpnVx9MdwHFU+21QTTGN0sZNf/CWRD9djTNtRTHXOYIyx9GMO
 x5IEoNPNDSRaiSU7DxzU/qgtthHHJS2ckTjHZJCifoK4Vrz+1oIStFGq2jk6Lc5tGV+9
 pLKhjmNLjqIfB+OrXO1RuxEnpqViBUu9Zc7kY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:subject:in-reply-to:references
 :user-agent:date:message-id:mime-version:content-type;
 bh=qNnyMKrll/R9ncgJlqHRTPxntS4V5kHGH9b3dXQQHFI=;
 b=YZR+Q6Wwijn8JELKk2csob8eil0oNwnY0f3uXrmTS5GTZFiwmveZ6kA3uRcxq0prRK
 vGEPMix2S6m2BbkYjunghMZo9y2ujOSSKMoVnjalpq/eq1878xO1hM56cS76WAOgRDJN
 CALcmyumpYds3Y0Hvocjo6wmvgRYMPQUX3UvjFGo0xEWCDdtx5AvPedcLtOqND+4BWo/
 k5KOn4dwSuebgHaY4BOJ4aNK3+iRBlSPxvde8xlo7GX3w1bK7FX3GGMLXSdkaF67hzP3
 g3LA1nDDt/mXn62NtzHnXGGxT6et1cV/9YRl0VI3uUdiqSVAPIZC6uDqaDlAAFn5fBw+
 2kCQ==
X-Gm-Message-State: AG10YOTxBvFBWADAobDnukSdifFaLNWP3sJovR3URyIcWLbslVzdYnQi0VKdCNxlwrCX9w==
X-Received: by 10.98.13.68 with SMTP id v65mr1858886pfi.150.1455281288727;
 Fri, 12 Feb 2016 04:48:08 -0800 (PST)
Received: from localhost (ppp121-45-195-205.lns20.cbr1.internode.on.net.
 [121.45.195.205])
 by smtp.gmail.com with ESMTPSA id 1sm19395210pfm.10.2016.02.12.04.48.07
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 12 Feb 2016 04:48:08 -0800 (PST)
From: Daniel Axtens <dja@axtens.net>
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org
Subject: Re: [PATCH openbmc-build-scripts] build-setup: Ensure we fail the
 build when a step fails
In-Reply-To: <1455254421-26850-2-git-send-email-openbmc-patches@stwcx.xyz>
References: <1455254421-26850-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1455254421-26850-2-git-send-email-openbmc-patches@stwcx.xyz>
User-Agent: Notmuch/0.21 (http://notmuchmail.org) Emacs/24.5.1
 (x86_64-pc-linux-gnu)
Date: Fri, 12 Feb 2016 23:48:03 +1100
Message-ID: <87wpqajdrw.fsf@gamma.ozlabs.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 12 Feb 2016 12:48:14 -0000

Hi Joel,

This is an excellent idea.

When writing bash scripts I tend to use the invocation from
http://redsymbol.net/articles/unofficial-bash-strict-mode/
i.e.

set -euo pipefail

Which will give you:
 - failing when a step fails (-e)
 - failing on undefined variables (-u)
 - failing when a command in a pipe fails (-o pipefail) - the default
 behaviour is to use the exit code of the final command in the pipe.

That might be an improvement over just using -e?

Regards,
Daniel

OpenBMC Patches <openbmc-patches@stwcx.xyz> writes:

> From: Joel Stanley <joel@jms.id.au>
>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>  build-setup.sh | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/build-setup.sh b/build-setup.sh
> index a96ed44..f2a37fa 100755
> --- a/build-setup.sh
> +++ b/build-setup.sh
> @@ -7,8 +7,8 @@
>  #   distro = fedora|ubuntu
>  #   WORKSPACE = 
>  
> -# Trace bash processing
> -set -x
> +# Trace bash processing. Set -e so when a step fails, we fail the build
> +set -xe
>  
>  # Default variables
>  target=${target:-qemu}
> @@ -100,7 +100,7 @@ mkdir -p ${WORKSPACE}
>  cat > "${WORKSPACE}"/build.sh << EOF_SCRIPT
>  #!/bin/bash
>  
> -set -x
> +set -ex
>  
>  cd ${WORKSPACE}
>  
> -- 
> 2.7.1
>
>
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
