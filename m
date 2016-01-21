Return-Path: <jk@ozlabs.org>
Received: from ozlabs.org (ozlabs.org [103.22.144.67])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 572A91A001D
 for <openbmc@lists.ozlabs.org>; Thu, 21 Jan 2016 17:10:48 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPSA id 21C4E1402D9;
 Thu, 21 Jan 2016 17:10:48 +1100 (AEDT)
Subject: Re: [PATCH openbmc 1/6] create obmc-phosphor-initfs
To: openbmc@lists.ozlabs.org
References: <1453331420-6524-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1453331420-6524-2-git-send-email-openbmc-patches@stwcx.xyz>
Cc: "Milton D. Miller II" <miltonm@us.ibm.com>
From: Jeremy Kerr <jk@ozlabs.org>
X-Enigmail-Draft-Status: N1110
Message-ID: <56A07667.8020800@ozlabs.org>
Date: Thu, 21 Jan 2016 14:10:47 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <1453331420-6524-2-git-send-email-openbmc-patches@stwcx.xyz>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
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
X-List-Received-Date: Thu, 21 Jan 2016 06:10:48 -0000

Hi Milton,

Looks good to me. One suggestion:


> +	echo Please mount the rw file system on $rwdir from this shell
> +	while ! sulogin && ! test -f /takeover
> +	do
> +		echo getty failed, retrying
> +	done

Can we make this message a little more descriptive? Something like:

cat <<EOF
Failed to mount read/write filesystem (mtdblock${rwfs#mtd})
Please manually mount it on $rwdir from this shell, or
exit the shell to continue without a rw filesystem.

EOF

> diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-shutdown.sh b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-shutdown.sh
> new file mode 100644
> index 0000000..85fd1e9
> --- /dev/null
> +++ b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-shutdown.sh
> @@ -0,0 +1,55 @@

Just to clarify: this shutdown script is completely separate from the
update mechanism, right? In what situations do you see it being used?

Cheers,


Jeremy
