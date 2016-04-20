Return-Path: <stewart@linux.vnet.ibm.com>
Received: from e38.co.us.ibm.com (e38.co.us.ibm.com [32.97.110.159])
 (using TLSv1.2 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qqpYb2v8yzDqfb
 for <openbmc@lists.ozlabs.org>; Thu, 21 Apr 2016 03:20:35 +1000 (AEST)
Received: from localhost
 by e38.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <stewart@linux.vnet.ibm.com>;
 Wed, 20 Apr 2016 11:20:32 -0600
Received: from d03dlp01.boulder.ibm.com (9.17.202.177)
 by e38.co.us.ibm.com (192.168.1.138) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Wed, 20 Apr 2016 11:20:31 -0600
X-IBM-Helo: d03dlp01.boulder.ibm.com
X-IBM-MailFrom: stewart@linux.vnet.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by d03dlp01.boulder.ibm.com (Postfix) with ESMTP id 5B3CA1FF0023
 for <openbmc@lists.ozlabs.org>; Wed, 20 Apr 2016 05:20:16 -0600 (MDT)
Received: from d03av04.boulder.ibm.com (d03av04.boulder.ibm.com [9.17.195.170])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u3KHKUws41484464
 for <openbmc@lists.ozlabs.org>; Wed, 20 Apr 2016 10:20:30 -0700
Received: from d03av04.boulder.ibm.com (loopback [127.0.0.1])
 by d03av04.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u3KHKUji024515
 for <openbmc@lists.ozlabs.org>; Wed, 20 Apr 2016 11:20:30 -0600
Received: from birb.localdomain ([9.80.196.127])
 by d03av04.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u3KHKSs6024414; Wed, 20 Apr 2016 11:20:29 -0600
Received: by birb.localdomain (Postfix, from userid 1000)
 id 29328229EAA9; Wed, 20 Apr 2016 10:20:25 -0700 (PDT)
From: Stewart Smith <stewart@linux.vnet.ibm.com>
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org
Cc: Ken <ken1029@gmail.com>
Subject: Re: [PATCH skeleton v6 07/20] fix info memory leak
In-Reply-To: <1460703717-23960-8-git-send-email-openbmc-patches@stwcx.xyz>
References: <1460703717-23960-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1460703717-23960-8-git-send-email-openbmc-patches@stwcx.xyz>
User-Agent: Notmuch/0.21+24~gbceb651 (http://notmuchmail.org) Emacs/24.5.1
 (x86_64-redhat-linux-gnu)
Date: Wed, 20 Apr 2016 10:20:25 -0700
Message-ID: <87wpnskxie.fsf@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16042017-0029-0000-0000-0000238A2FB4
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
X-List-Received-Date: Wed, 20 Apr 2016 17:20:36 -0000

OpenBMC Patches <openbmc-patches@stwcx.xyz> writes:
> From: Ken <ken1029@gmail.com>
>
> ---
[ 35 more citation lines. Click/Enter to show. ]
>  objects/info.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/objects/info.c b/objects/info.c
> index ab2d98c..d872c3f 100644
> --- a/objects/info.c
> +++ b/objects/info.c
> @@ -42,6 +42,7 @@ static int i2c_open() {
>    fd = open(fn, O_RDWR);
>    if (fd == -1) {
>      LOG_ERR(errno, "Failed to open i2c device %s", fn);
> +    close(fd);
>      return -1;
>    }
>  
> @@ -108,6 +109,7 @@ static int i2c_io(int fd) {
>    rc = ioctl(fd, I2C_RDWR, &data);
>    if (rc < 0) {
>      LOG_ERR(errno, "Failed to do raw io");
> +    close(fd);
>      return -1;
>    }
>  
> @@ -126,6 +128,7 @@ int get_hdd_status(void)
>    }
>  
>    if (i2c_io(fd) < 0) {
> +    close(fd);
>      return -1;
>    }
>  
> @@ -145,7 +148,7 @@ int get_hdd_status(void)
>  
>      g_read_tmp[2]=g_read_bytes[2];
>      g_read_tmp[3]=g_read_bytes[3];
> -
> +    close(fd);
>  }

Please fold into patch that introduced the code.

-- 
Stewart Smith
OPAL Architect, IBM.
