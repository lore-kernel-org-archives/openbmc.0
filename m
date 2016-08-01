Return-Path: <joel.stan@gmail.com>
Received: from mail-ua0-x241.google.com (mail-ua0-x241.google.com
 [IPv6:2607:f8b0:400c:c08::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3s2rGX2yHlzDqQ9
 for <openbmc@lists.ozlabs.org>; Mon,  1 Aug 2016 17:16:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=eLZkBh1C; 
 dkim-atps=neutral
Received: by mail-ua0-x241.google.com with SMTP id 15so6058883uai.1
 for <openbmc@lists.ozlabs.org>; Mon, 01 Aug 2016 00:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=T33+oBp4e9Zos7+Cg0MKv40oa2np2XaBMtyuHLo4l20=;
 b=eLZkBh1CTFfWVXZWGDh6Dh3zStlGhyiqaXJAVHxgdiHehy24sdRcI2KfQH6lW132Xh
 RHuB2uNoh5THp1GraZFm2Pt9DZIWSKLLvIE4HA3lfKvM6tzfmz7FZmPbN0+foapaZZwQ
 k2RT03N8GJOjBSfQX3Z/JePXLgVoe5K5R9YWsXsL596yl3+QUF6Sf14ZUc2W2mgqFzi7
 ySqZ62k0WX/hGo5jzAste/vVDavQp4HMYoqCHzP6BWpZXKMCs0QmF6BvXhKaiWeJHhPw
 t5xLekouAyJI4epnm5SKyQcvscUyyuDzBHhYKdGJ/TjVq2MJwNVpy5z72vFlEDDDzbX0
 +y7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=T33+oBp4e9Zos7+Cg0MKv40oa2np2XaBMtyuHLo4l20=;
 b=IiVKfZ2imWeqvnxCDfYVN3uNkG/DzxWM8c8N2ZmsWuNyyRe9p6eTfE/HiymJqqlQR2
 cAo1JEQDfPBXFRGzKY7Q8OPBH9X4pP4z0NSfZfvFsxQgFGl2jfneaidA8eAI+Q3DZ8pM
 051KkSmmmswX3W3QEccbQ7e8AZ1+zg8Mp8SDdgW9ip76Zj8oEOXUOmRFruKSKjQ2oH+8
 8AjW1xa2+xqZLY5J22LS90EJWJWQBrZD4pP2HZLEZvBcqegY3GtRC9kzg3HyvqemtzKo
 dkPoIfHqoAAHnH/dFIwUvlSWjEHFsdzTj4iDPA6latQ35RvkeX0wZiMScHPWRf+Ut/Gf
 uDzg==
X-Gm-Message-State: AEkoouvTkC9k65uUvj58otPiB4Mc+at/RBnQo68hcbzP4jkiwV/i+evlr9cmMP6FtizY8lpSfdi6zlzgYiOh6w==
X-Received: by 10.176.2.87 with SMTP id 81mr25391133uas.57.1470035761576; Mon,
 01 Aug 2016 00:16:01 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.176.5.230 with HTTP; Mon, 1 Aug 2016 00:15:42 -0700 (PDT)
In-Reply-To: <1469729698-37246-3-git-send-email-christopher.lee.bostic@gmail.com>
References: <1469729698-37246-1-git-send-email-christopher.lee.bostic@gmail.com>
 <1469729698-37246-3-git-send-email-christopher.lee.bostic@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 1 Aug 2016 16:45:42 +0930
X-Google-Sender-Auth: KHyHyIh-Wa9fSIF_DPZ1T140ThM
Message-ID: <CACPK8Xeztb_0QiE8dv45pKzmynGKukmZp7xY=Jn8TW_=hMrvWA@mail.gmail.com>
Subject: Re: [PATCH linux 3/4] drivers/fsi: Add link presence detect
 functionality
To: Christopher Bostic <christopher.lee.bostic@gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Chris Bostic <cbostic@us.ibm.com>
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
X-List-Received-Date: Mon, 01 Aug 2016 07:16:05 -0000

On Fri, Jul 29, 2016 at 3:44 AM,  <christopher.lee.bostic@gmail.com> wrote:
> From: Chris Bostic <cbostic@us.ibm.com>
>
> Start scanning for CFAM presence on available links.

Elaborate here. Briefly explain what a CFAM too.

>
> Signed-off-by: Chris Bostic <cbostic@us.ibm.com>
> ---
>  drivers/fsi/fsimaster.c | 154 +++++++++++++++++++++++++++++++++++++++++++++++-
>  drivers/fsi/fsimaster.h |  33 ++++++++++-
>  2 files changed, 185 insertions(+), 2 deletions(-)

This one has a few checkpatch errors too:

total: 3 errors, 1 warnings, 240 lines checked

>
> diff --git a/drivers/fsi/fsimaster.c b/drivers/fsi/fsimaster.c
> index 96f6f60..0827f0b 100644
> --- a/drivers/fsi/fsimaster.c
> +++ b/drivers/fsi/fsimaster.c
> @@ -22,9 +22,28 @@
>
>  extern struct primaster prim;
>
> +static int fsi_nextbit(u32 *new, int words)
> +{
> +       int bit, i;
> +       u32 mask;
> +
> +       for (i = 0; i < words; i++) {
> +               mask = 0x80000000;
> +               for (bit = 0; bit < BITS_PER_LONG; bit++) {

What's this code trying to do? Given you call it with new pointing to
an array of two u32 I think there is a bug here.

> +                       if( new[bit] & mask )
> +                               return bit + i * BITS_PER_LONG;
> +               }
> +       }
> +       return -1;
> +}
> +
> +u32 fsim_cfam2pa(struct fsimaster *p, int link, int cfam)
> +{
> +       return 0;
> +}
> +
>  static int hpinfo_alloc(struct fsimaster *p)
>  {
> -       /* Stub */
>         return 0;
>  }
>
> @@ -179,6 +198,20 @@ struct fsimaster * fsim_get_top_master(struct fsimaster *p)
>         return parent;
>  }
>
> +/*
> + * Work queue function to probe for links
> + */
> +static void probe_wq(struct work_struct *nix)
> +{
> +}
> +
> +/*
> + * Work queue function to build up links
> + */
> +static void build_wq(struct work_struct *nix)
> +{
> +}
> +
>  static int fsimaster_reset(struct fsimaster *p)
>  {
>         u32 mresp, maeb, mver, mectrl, mmode, menp[2];
> @@ -251,6 +284,10 @@ struct fsimaster *fsimaster_build_init(struct fsimaster *p, int type,
>         }
>         p->type = type;
>         p->fsidev = parent;
> +       init_timer(&p->hotp.mytimer);
> +       init_completion(&p->hotp.i_am_dead);
> +       INIT_WORK(&p->hotp.probewrk, probe_wq);
> +       INIT_WORK(&p->hotp.buildwrk, build_wq);
>         if( fsimaster_init(p)) {
>                 p = 0;
>                 goto out;
> @@ -264,9 +301,124 @@ out:
>         return p ? : ERR_PTR(rc);
>  }
>
> +static void plugadd_link(struct fsimaster *p, struct hp_info *hp)
> +{
> +       u32 addr;
> +
> +       hp->ec = 0;
> +       atomic_set(&hp->state, FSI_LINK_INPROBE);
> +       set_bit(hp->linkno, p->hotp.probing);
> +       addr = fsi_mtype2pa(fsim_cfam2pa(p, hp->linkno, 0), p->type);
> +}
> +
> +static void plugadd(struct fsimaster *p, u32 *diff)
> +{
> +       int linkno;
> +       struct fsidd *dd = to_fsidd_prim(fsim_get_top_master(p));
> +
> +       set_bit(FSIDD_PROBE, &dd->state);
> +       while ((linkno = fsi_nextbit(diff, 2)) >= 0) {
> +               if (linkno >= p->maxlinks)
> +                       break;
> +               plugadd_link(p, p->hotp.plug[linkno]);
> +       }
> +}
> +
> +static void plugdel(struct fsimaster *p, u32 *diff)
> +{
> +}
> +
> +/*
> + * Look for CFAMs plugged into any of the available link slots
> + */
> +int fsim_staticplug_nl(struct fsimaster *p, u32 *menp, u32 *mlevp)

What's _nl mean?

> +{
> +       int rc = 0;
> +
> +       rc = (*p->read_f2)(p->mp, FSI_N_MENP0, menp);
> +       if (rc)
> +               goto done;

Your read_f2 function always returns 0, so no need to check.

> +       rc = (*p->read_f2)(p->mp, FSI_N_MLEVP0, mlevp);
> +
> +done:
> +       return rc;
> +}
> +
> +int fsim_staticplug(struct fsimaster *p, u32 *menp, u32 *mlevp)
> +{
> +       int rc = 0;
> +       unsigned long msr = 0;
> +
> +       spin_lock_irqsave(&p->lock, msr);
> +       rc = fsim_staticplug_nl(p, menp, mlevp);
> +       spin_unlock_irqrestore(&p->lock, msr);
> +
> +       return rc;

This return value does not indicate anything useful. Make the function void.


> +}
> +
> +/*
> + * Periodically called function to check for static plug changes
> + */
> +static void plugmgr(unsigned long para)
> +{
> +       struct fsimaster *p = (struct fsimaster *)para;
> +       struct fsidd *dd;
> +       int rc;
> +       u32 mlevp[2], menp[2], delta[2], new[2], gone[2];
> +
> +       rc = fsim_staticplug(p, menp, mlevp);
> +       if (rc)
> +               goto done;
> +
> +       dd = to_fsidd_prim(fsim_get_top_master(p));
> +
> +       mlevp[0] |= menp[0];
> +       mlevp[1] |= menp[1];
> +       delta[0] = p->hotp.mlevp_last[0] ^ mlevp[0];
> +       delta[1] = p->hotp.mlevp_last[1] ^ mlevp[1];
> +       new[0] = delta[0] & mlevp[0];
> +       new[1] = delta[1] & mlevp[1];
> +       gone[0] = delta[0] & p->hotp.mlevp_last[0];
> +       gone[1] = delta[1] & p->hotp.mlevp_last[1];
> +       p->hotp.mlevp_last[0] = mlevp[0];
> +       p->hotp.mlevp_last[1] = mlevp[1];

This chunk is hard to understand. I suggest giving the variables more
meaningful names and adding some comments about what the intent is.

> +
> +       if (gone[0] || gone[1])
> +               plugdel(p, gone);
> +       if (new[0] || new[1])
> +               plugadd(p, new);
> +
> +       queue_work(dd->hotp_wq, &p->hotp.probewrk);
> +       if (p->hotp.building[0] == 0 && p->hotp.building[1] == 0)
> +               clear_bit(FSIDD_PROBE, &dd->state);
> +       if (p->hotp.building[0] || p->hotp.building[1])
> +               queue_work(dd->hotp_wq, &p->hotp.buildwrk);
> +
> +       mod_timer(&p->hotp.mytimer,
> +                 jiffies + msecs_to_jiffies(FSI_DFLT_PLUG_CHECK));
> +done:
> +       return;
> +}
> +
>  /*
>   * Kick off the master so it can start probing for attached CFAMs
>   */
>  void fsimaster_start(struct fsimaster *p)
>  {
> +       struct fsi_mreg *regs = &(prim.regs);

Drop the brackets.

> +
> +       memset(regs, 0, sizeof(struct fsi_mreg));
> +       p->mp = (u32 *)regs;

Is ->mp a pointer to the register space? If it is, I suggest calling
it something common like base and make it a type void __iomem *.

But you're assigning a struct fsi_mreg to it, so it's not a pointer to
register space. Or is that struct a description of the registers?

Regardless, ->mp should be a struct fsi_mreg. That would avoid your cast.

> +
> +       /*
> +        * TODO: Implement presence detect via I/O
> +        * For now we'll define the default as link 0 as present
> +        */
> +       regs->mlevp0[0] = 0x80000000;
> +
> +       /* Kick off the presence detect polling routine */
> +       p->hotp.mytimer.function = plugmgr;
> +       p->hotp.mytimer.data = (unsigned long)p;
> +       p->hotp.mytimer.expires = jiffies + msecs_to_jiffies(FSI_DFLT_PLUG_CHECK);

The #define here doesn't indicate that it's a unit of time.

> +       add_timer(&p->hotp.mytimer);
>  }
> diff --git a/drivers/fsi/fsimaster.h b/drivers/fsi/fsimaster.h
> index b07934e..40f4f4c 100644
> --- a/drivers/fsi/fsimaster.h
> +++ b/drivers/fsi/fsimaster.h
> @@ -21,6 +21,16 @@
>  #define        FSI_DFLT_PLUG_CHECK     100
>  #define FSI_DFLT_IPOLL_CHECK   800
>
> +/* Link states */
> +#define FSI_LINK_FREE          1       /* Nothing plugged */
> +#define FSI_LINK_INPROBE       2       /* Link probed */
> +#define FSI_LINK_INPOLL                3       /* I-Poll test */
> +#define FSI_LINK_INBUILD       4       /* Building */
> +#define FSI_LINK_RUNNING       5       /* Up and functional */
> +#define FSI_LINK_INLOST                6       /* Link dropped */
> +#define FSI_LINK_DEAD          7       /* No longer useable */
> +#define FSI_LINK_WAITFOR       8       /* Notify on completion */
> +
>  /* FSI master register numbers */
>  #define        FSI_N_MMODE     0       /* 0x0   R/W: mode register */
>  #define        FSI_N_MDLYR     1       /* 0x4   R/W: delay register */
> @@ -522,6 +532,26 @@ static inline unsigned long get_termpa(unsigned long slv_pa)
>         return slv_pa & ~0xfff;
>  }
>

Some suggestions for these names when reading the code that uses this struct:

> +struct hp_info {                       /* Hot plug information */

fsi_hotplug?

> +       struct completion done;         /* Link build done */
> +       unsigned short tries;           /* # of tries before probing */
> +       unsigned char linkno;           /* Link # */
> +       atomic_t state;                 /* State of this entry */
> +       int ec;                         /* Error code */

error? error_code?

> +       unsigned long state_w;          /* Wait state */

wait_state?

> +};
> +
> +struct hotplug {                       /* Hot Plug work structure */
> +       u32 mlevp_last[2];              /* Last known plug state */
> +       unsigned long building[2];      /* Bit mask of links to build up */
> +       unsigned long probing[2];       /* Bit mask of links to  probe */

Is there a reason this is an array of longs, and not a u64?

> +       struct timer_list mytimer;      /* For periodic plug check */
> +       struct work_struct probewrk;    /* Probe worker */

I'll buy you a vowel. probe_work?

> +       struct work_struct buildwrk;    /* Build worker */
> +       struct completion i_am_dead;    /* Wait for workw to finish */

Haha. Perhaps link_dead?

> +       struct hp_info *plug[FSI_MAX_LINKS];    /* Data to work on */
> +};
> +
>  struct master_quirks {
>         int break_cfam_id;
>         void (*port_reset)(struct fsidevice *, struct fsidevice *, int);
> @@ -546,6 +576,7 @@ struct fsimaster {                  /* FSI master definition */
>         unsigned char hw_version;       /* FSI master hardware version */
>         unsigned char maxlinks;         /* FSI master links */
>         struct fsilink *link[FSI_MAX_LINKS];
> +       struct hotplug hotp;            /* Hot plug link information */
>         int (*write_f)(volatile u32 *, int, u32);       /* Write function */
>         int (*read_f)(volatile u32 *, int, u32 *);      /* Read function */
>         int (*write_f2)(volatile u32 *, int, u32 *);    /* Write function */
> @@ -624,7 +655,7 @@ unsigned long fsi_matrb_addr(unsigned long);
>  /*
>   * Helper utilities for link/cfam calculations.
>   */
> -phys_addr_t fsim_cfam2pa(struct fsimaster *, int, int);
> +u32 fsim_cfam2pa(struct fsimaster *, int, int);
>  unsigned long fsim_linksz(struct fsimaster *);
>  unsigned long fsim_cfamsz(struct fsimaster *);
>
> --
> 1.8.2.2
>
