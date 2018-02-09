Return-Path: <jk@ozlabs.org>
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zd3Yw6bDhzF1Bp
 for <openbmc@lists.ozlabs.org>; Fri,  9 Feb 2018 16:30:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.b="gaSF5WSn"; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPSA id 3zd3Yw12Fzz9s72;
 Fri,  9 Feb 2018 16:30:44 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1518154244; bh=mdxHldUCqqcsy4lPJiyBVUc23+Ddf7nxQUG9uJJJ/C8=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=gaSF5WSnNyYvJ457kNvnhV9IMw3K/CnVXrPXI8gfocNF1tAIMks62uEs8RYkdc7Me
 3b7wUmupxxZh7FhCT+1oFbP+1W5IFHDcnNVEyVtspSIR4LH7g7Eza9+YHZ2k/7Vgku
 919XLcakS7I4AApOuB7rl7K1VwFYvAB42sepr2M9Zd2awXzJJ6ox6NcjSI+jIgOM6w
 N1CuUMNPjnMAUw6ntM/jkkR4Ok6sykZsXBlFjzHluQkBk1IolDFQEybSxPbJtZ8h8i
 XFbdT7FBbctu4yHckI8PlvglR71ZZc9Hw+1l9W4TgZxmrREXp4VZAjs3YKOpQVt9Qe
 3QcxahJ0UHeBQ==
Subject: Re: [PATCH linux dev-4.13] fsi: core: Depend on OF
To: Joel Stanley <joel@jms.id.au>, openbmc@lists.ozlabs.org
References: <20180209032048.27450-1-joel@jms.id.au>
From: Jeremy Kerr <jk@ozlabs.org>
Message-ID: <fb0bc8c5-f0ca-4515-7f10-46c5af427622@ozlabs.org>
Date: Fri, 9 Feb 2018 13:30:43 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <20180209032048.27450-1-joel@jms.id.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.25
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 09 Feb 2018 05:30:45 -0000

Hi Joel,

> The recent changes to match FSI slaves and engines to device tree nodes
> introduced a dependency on 'of_' functions. As all in-tree users of FSI
> are ARM OF platforms, make the FSI core depend on OF.
> 
> Fixes: 46d6856a33e67 ("fsi: Match fsi slaves and engines to available dt nodes")

Definitely needed, thanks for that.

Acked-by: Jeremy Kerr <jk@ozlabs.org>

Cheers,


Jeremy
