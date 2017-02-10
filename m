Return-Path: <joel.stan@gmail.com>
Received: from mail-ua0-x241.google.com (mail-ua0-x241.google.com
 [IPv6:2607:f8b0:400c:c08::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vKHBM5gXfzDqKg
 for <openbmc@lists.ozlabs.org>; Fri, 10 Feb 2017 12:18:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="D9YKvupd"; 
 dkim-atps=neutral
Received: by mail-ua0-x241.google.com with SMTP id d5so1799380uag.0
 for <openbmc@lists.ozlabs.org>; Thu, 09 Feb 2017 17:18:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=fG+IPMOPPNu+BZxu6Zb3szwjQLnLMAFeEYOy6eQBLqk=;
 b=D9YKvupdg3m4Ap3tEUBeGGtJysGaaH0CWYJsrL+54dt7h1fPxKAPV+UdOxMrtU5yVr
 ppKc/OqLnWZLr3AhSSkW6Vvq5AYz8R/sHYFo15sqz7pFZEdOyo9s0c1XFZbrnuVGLmeY
 BVbIwA8zLIyZnmviYXONcGJxaNAxarEzMoPp+r4cSn6fjEM/tVb54RCa5kS13hEixlQV
 dm/9dw8yl/JYrnKSb+0opB3xSPMwTTgKT7o0PKrcp4ZAAT6kikSKFUQCM0FACyqOXwbP
 lFDoDa5GgDWXmxEyYc/29TEH4daqdtudY3P3NjvKBt3tIEVrGo1IhT5eAD8e/09qYg93
 a8wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=fG+IPMOPPNu+BZxu6Zb3szwjQLnLMAFeEYOy6eQBLqk=;
 b=rfo22UYe5mR1xvOg3imPcnENdD2CRAAWCwv1HR2aegtdDxdwaEV+pOOAkBYTv30ee0
 XiC39KaAq2k0cutTMRPpcUD15o4Wwj/7xbsPXodquhSIdcFpWGayY1BDHVPwZ9R20psa
 c6xcbM+EokI4VLykkgYeICYekSa1RBIeKIBAeB+3nArJoQxVszrpIrBgBU0dX/scGuvy
 SGo8IKhswCx5VDNbVPtxQYoHt+R6U5sn6A52K3KZkkRM0PKstAEyDGlQbMA+px/gcU0W
 y2tr2Zx6Edi+nMDItpmzNfo/PliT7pfKhlgKu1BOdvpnkC8YwzuEAY9R93/9FCL8u4s0
 yVpQ==
X-Gm-Message-State: AMke39m8pIisblTjKheJjBEJUpJEyTjTnQhvRdtIJb89X8WcqxhP/HjdLndUtl/ZdmgvNodF55CkC+iG60k22w==
X-Received: by 10.159.38.229 with SMTP id 92mr3299985uay.102.1486689480933;
 Thu, 09 Feb 2017 17:18:00 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.176.92.150 with HTTP; Thu, 9 Feb 2017 17:17:40 -0800 (PST)
In-Reply-To: <1486499563-11330-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1486499563-11330-1-git-send-email-eajames@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 10 Feb 2017 11:47:40 +1030
X-Google-Sender-Auth: 6SCPsfdsPq78_qrk2WxQaRMDzSA
Message-ID: <CACPK8XfF5MhtgwAmwnYT_ZT2XrGKE-2hm-maas+B6ZEK_Z5Vug@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.7] drivers: fsi: i2c fix probing
To: eajames <eajames@linux.vnet.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 Christopher Bostic <cbostic@linux.vnet.ibm.com>,
 "Edward A. James" <eajames@us.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Fri, 10 Feb 2017 01:18:04 -0000

On Wed, Feb 8, 2017 at 7:02 AM,  <eajames@linux.vnet.ibm.com> wrote:
> From: "Edward A. James" <eajames@us.ibm.com>
>
> resolve the problems when probing up the i2c driver a second time.
>
> Signed-off-by: Edward A. James <eajames@us.ibm.com>

This introduces a build warning:

  CC      drivers/fsi/i2c/iic-fsi.o
drivers/fsi/i2c/iic-fsi.c: In function =E2=80=98iic_del_ports=E2=80=99:
drivers/fsi/i2c/iic-fsi.c:279:1: warning: label =E2=80=98exit=E2=80=99 defi=
ned but not
used [-Wunused-label]
 exit:
 ^~~~

Please send a v2 with this resolved. I also need a review from Chris.

Cheers,

Joel

> ---
>  drivers/fsi/i2c/iic-fsi.c  | 124 +++------------------------------------=
------
>  drivers/fsi/i2c/iic-mstr.c |  42 +++------------
>  2 files changed, 14 insertions(+), 152 deletions(-)
>
> diff --git a/drivers/fsi/i2c/iic-fsi.c b/drivers/fsi/i2c/iic-fsi.c
> index 2c0aec9..1723bc3 100644
> --- a/drivers/fsi/i2c/iic-fsi.c
> +++ b/drivers/fsi/i2c/iic-fsi.c
> @@ -36,60 +36,12 @@
>  struct class* iic_fsi_class =3D 0;
>  dev_t iic_devnum_start =3D 0;
>
> -static const char iic_fsi_version[] =3D "3.0";
> +static const char iic_fsi_version[] =3D "3.1";
>
>  int iic_fsi_probe(struct device *dev);
>  int iic_fsi_remove(struct device *dev);
> -void iic_fsi_shutdown(struct device *dev);
>  int iic_fsi_suspend(struct device *dev);
>  int iic_fsi_resume(struct device *dev);
> -static void iic_eng_release(struct kobject* kobj);
> -
> -/* callback function for when the reference count for an engine reaches =
0 */
> -static void iic_eng_release(struct kobject* kobj)
> -{
> -       iic_eng_t* eng =3D container_of(kobj, iic_eng_t, kobj);
> -       struct device* dev =3D eng->dev;
> -       unsigned long flags;
> -
> -       IENTER();
> -
> -       /*remove all busses associated with the engine */
> -       spin_lock_irqsave(&eng->lock, flags);
> -       while(eng->busses){
> -               iic_bus_t* temp =3D eng->busses;
> -               eng->busses =3D temp->next;
> -               iic_delete_bus(iic_fsi_class, temp);
> -       }
> -
> -       eng->enabled =3D 0x0ULL;
> -       spin_unlock_irqrestore(&eng->lock, flags);
> -
> -
> -       /* providing an arch specific cleanup routine is optional.
> -        * if not specified, use the default.
> -        */
> -       if (iic_eng_ops_is_vaild(eng->ops)) {
> -               if(eng->ops->cleanup_eng)
> -               {
> -                       eng->ops->cleanup_eng(eng);
> -               }
> -               else
> -               {
> -                       IDBGd(0, "free engine\n");
> -                       kfree(eng);
> -               }
> -       }
> -
> -       dev_set_drvdata(dev, 0);
> -       kobject_put(&dev->kobj);
> -
> -       IEXIT(0);
> -}
> -
> -static struct kobj_type iic_eng_ktype =3D {
> -       .release =3D iic_eng_release,
> -};
>
>  int readb_wrap(iic_eng_t* eng, unsigned int addr, unsigned char *val,
>                iic_ffdc_t** ffdc)
> @@ -223,7 +175,7 @@ int iic_add_ports(iic_eng_t* eng, uint64_t ports)
>
>         IENTER();
>
> -       IFLDi(3, "Adding ports[0x%08x%08x] to eng[0x%08x]",
> +       IFLDi(3, "Adding ports[0x%08x%08x] to eng[0x%08x]\n",
>               (uint32_t)(ports >> 32),
>               (uint32_t)ports,
>               eng->id);
> @@ -305,8 +257,6 @@ int iic_del_ports(iic_eng_t* eng, uint64_t ports)
>
>         /* walk unordered SLL and delete bus if it is in the ports bit ma=
sk */
>         spin_lock_irqsave(&eng->lock, flags);
> -       if(test_bit(IIC_ENG_REMOVED, &eng->flags))
> -               goto exit;
>         p_abusp =3D &eng->busses;
>         abusp =3D *p_abusp;
>         while(abusp)
> @@ -316,7 +266,6 @@ int iic_del_ports(iic_eng_t* eng, uint64_t ports)
>                         /* found a match, remove it */
>                         *p_abusp =3D abusp->next;
>                         eng->enabled &=3D ~(0x1ULL << abusp->port);
> -                       device_destroy(iic_fsi_class, abusp->devnum);
>                         iic_delete_bus(iic_fsi_class, abusp);
>                 }
>                 else
> @@ -333,6 +282,7 @@ exit:
>         return 0;
>  }
>
> +#define IIC_FSI_PORTS  0xFFFULL
>  /*
>   * Called when an FSI IIC engine is plugged in.
>   * Causes creation of the /dev entry.
> @@ -361,12 +311,11 @@ int iic_fsi_probe(struct device *dev)
>         iic_init_eng(eng);
>         set_bit(IIC_ENG_BLOCK, &eng->flags); //block until resumed
>         eng->id =3D 0x00F5112C;
> -       IFLDi(1, "PROBE    eng[%08x]", eng->id);
> +       IFLDi(1, "PROBE    eng[%08x]\n", eng->id);
>         eng->ra =3D &fsi_reg_access;
>         IFLDd(1, "vaddr=3D%#08lx\n", eng->base);
>         eng->dev =3D dev;
>         // The new kernel now requires 2 arguments
> -       kobject_init(&eng->kobj, &iic_eng_ktype); //ref count =3D 1
>         eng->ops =3D iic_get_eng_ops(FSI_ENGID_I2C);
>         if(!eng->ops)
>         {
> @@ -382,7 +331,7 @@ int iic_fsi_probe(struct device *dev)
>
>         IFLDd(1, "irq  =3D %d\n", eng->irq);
>
> -       new_ports =3D 0xFFFULL;
> +       new_ports =3D IIC_FSI_PORTS;
>         set_bit(IIC_ENG_P8_Z8_CENTAUR, &eng->flags);
>
>
> @@ -394,21 +343,13 @@ int iic_fsi_probe(struct device *dev)
>         dev_set_drvdata(dev, eng);
>         eng->private_data =3D 0; //unused
>
> -
> -       /* set the callback function for when the eng ref count reaches 0=
 */
> -       kobject_get(&eng->dev->kobj);
> -
>         iic_fsi_resume(dev);
>
>  error:
>         if(rc)
>         {
>                 IFLDi(1, "IIC: iic_fsi_probe failed: %d\n", rc);
> -               while(eng && eng->busses){
> -                       iic_bus_t* temp =3D eng->busses;
> -                       eng->busses =3D temp->next;
> -                       iic_delete_bus(iic_fsi_class, temp);
> -               }
> +               iic_del_ports(eng, new_ports);
>                 if(eng)
>                 {
>                         kfree(eng);
> @@ -430,9 +371,7 @@ error:
>  int iic_fsi_remove(struct device* dev)
>  {
>         int rc =3D 0;
> -       iic_bus_t* bus;
>         iic_eng_t* eng =3D (iic_eng_t*)dev_get_drvdata(dev);
> -       unsigned long flags;
>
>         IENTER();
>
> @@ -453,62 +392,15 @@ int iic_fsi_remove(struct device* dev)
>         IFLDi(1, "REMOVE   eng[%08x]\n", eng->id);
>
>         /* Clean up device files immediately, don't wait for ref count */
> -       spin_lock_irqsave(&eng->lock, flags);
> -       bus =3D eng->busses;
> -       while(bus)
> -       {
> -               /* causes hot unplug event */
> -               device_destroy(iic_fsi_class, bus->devnum);
> -               bus =3D bus->next;
> -       }
> -       spin_unlock_irqrestore(&eng->lock, flags);
> -
> +       iic_del_ports(eng, IIC_FSI_PORTS);
>         /* cleans up engine and bus structures if ref count is zero */
> -       kobject_put(&eng->kobj);
> +       kfree(eng);
>
>  error:
>         IEXIT(0);
>         return 0;
>  }
>
> -/* This function is called when a link is removed or the driver is unloa=
ded.
> - * It's job is to quiesce and disable the hardware if possible and unreg=
ister
> - * interrupts. It always precedes the remove function.
> - *
> - * The device may be in the resumed or suspended state when this functio=
n is
> - * called.
> - *
> - * This function is no longer called for mcp5
> - */
> -void iic_fsi_shutdown(struct device *dev)
> -{
> -       int rc =3D 0;
> -       iic_eng_t* eng =3D (iic_eng_t*)dev_get_drvdata(dev);
> -
> -       IENTER();
> -       if(!eng || !eng->ops)
> -       {
> -               rc =3D -1;
> -               goto error;
> -       }
> -       IFLDi(1, "SHUTDOWN eng[%08x]\n", eng->id);
> -
> -       /* set ENG_REMOVED flag so that aborted operations have status
> -        * set to ENOLINK (lost fsi link) instead of ENODEV (no lbus).
> -        */
> -       set_bit(IIC_ENG_REMOVED, &eng->flags);
> -
> -       iic_fsi_suspend(dev);
> -
> -error:
> -       if(rc)
> -       {
> -               IFLDe(1, "iic_fsi_shutdown failed: %d\n", rc);
> -       }
> -       IEXIT(0);
> -       return;
> -}
> -
>  /* This function is called when we loose ownership or are preparing to g=
ive
>   * up ownership of the local bus.  If we still own lbus, then we try to
>   * gracefully halt any pending transfer.  No hot unplug events are cause=
d by
> diff --git a/drivers/fsi/i2c/iic-mstr.c b/drivers/fsi/i2c/iic-mstr.c
> index 0d97671..5501b22 100644
> --- a/drivers/fsi/i2c/iic-mstr.c
> +++ b/drivers/fsi/i2c/iic-mstr.c
> @@ -83,27 +83,7 @@ iic_opts_t iic_dflt_opts =3D
>         }
>  };
>
> -static const char iic_mstr_version[] =3D "3.0";
> -
> -/* save off the default cdev type pointer so we can call the default cde=
v
> - * release function in our own bus release function
> - */
> -static struct kobj_type* cdev_dflt_type =3D 0;
> -struct kobj_type iic_bus_type;
> -
> -/* funtion called when cdev object (embedded in bus object) ref count
> - * reaches zero.  (prevents cdev memory from being freed to early)
> - */
> -void iic_bus_release(struct kobject* kobj)
> -{
> -       struct cdev *p =3D container_of(kobj, struct cdev, kobj);
> -       iic_bus_t* bus =3D container_of(p, iic_bus_t, cdev);
> -
> -       IFLDi(1, "deleting bus[%08lx]\n", bus->bus_id);
> -       if(cdev_dflt_type && cdev_dflt_type->release)
> -               cdev_dflt_type->release(kobj);
> -       kfree(bus);
> -}
> +static const char iic_mstr_version[] =3D "3.1";
>
>  int iic_open(struct inode* inode, struct file* filp);
>  int iic_release(struct inode* inode, struct file* filp);
> @@ -167,7 +147,6 @@ int iic_common_open(iic_client_t ** o_client, iic_bus=
_t * bus, int engine_num)
>         client->tgid =3D current->tgid;
>         sema_init(&client->sem, 1);
>         init_waitqueue_head(&client->wait);
> -       kobject_get(&bus->eng->kobj);
>         *o_client =3D client;
>
>  exit:
> @@ -262,7 +241,6 @@ int iic_common_release(iic_client_t * client)
>
>          client->bus =3D 0;
>          kfree(client);
> -        kobject_put(&bus->eng->kobj);
>
>          IEXIT(rc);
>          return rc;
> @@ -1170,6 +1148,7 @@ EXPORT_SYMBOL(iic_sideways_read);
>  ssize_t iic_read(struct file *filp, char __user *buf, size_t count,
>                  loff_t *offset)
>  {
> +       int rc_copy;
>         ssize_t rc =3D count;
>         char *kbuf;
>         iic_client_t *client =3D (iic_client_t*)filp->private_data;
> @@ -1203,7 +1182,7 @@ ssize_t iic_read(struct file *filp, char __user *bu=
f, size_t count,
>         if (rc < 0)
>                 goto free;
>
> -       rc =3D copy_to_user(buf, kbuf, count);
> +       rc_copy =3D copy_to_user(buf, kbuf, count);
>
>  free:
>         kfree(kbuf);
> @@ -2148,23 +2127,11 @@ iic_bus_t*  iic_create_bus(struct class* classp, =
iic_eng_t* eng,
>         bus->devnum =3D devnum;
>         bus->i2c_hz =3D 400000;
>         cdev_init(&bus->cdev, &iic_fops); // ref count =3D 1
> -       /* since cdev is embedded in our bus structure, override the cdev
> -        * cleanup function with our own so that the bus object doesn't g=
et
> -        * freed until the cdev ref count goes to zero.
> -        */
> -       if(!cdev_dflt_type)
> -       {
> -               cdev_dflt_type =3D bus->cdev.kobj.ktype;
> -               memcpy(&iic_bus_type, cdev_dflt_type, sizeof(iic_bus_type=
));
> -               iic_bus_type.release =3D iic_bus_release;
> -       }
> -       bus->cdev.kobj.ktype =3D &iic_bus_type;
>         kobject_set_name(&bus->cdev.kobj, name);
>         rc =3D cdev_add(&bus->cdev, devnum, 1);
>         if(rc)
>         {
>                 IFLDe(1, "cdev_add failed for bus %08lx\n", bus->bus_id);
> -               kobject_put(&bus->cdev.kobj);
>                 goto exit_cdev_add;
>         }
>
> @@ -2186,6 +2153,7 @@ iic_bus_t*  iic_create_bus(struct class* classp, ii=
c_eng_t* eng,
>  exit_class_add:
>         cdev_del(&bus->cdev);
>  exit_cdev_add:
> +       kfree(bus);
>         bus =3D 0;
>  exit:
>         IEXIT((int)bus);
> @@ -2202,7 +2170,9 @@ void iic_delete_bus(struct class* classp, iic_bus_t=
* bus)
>                 goto exit;
>         }
>         IFLDi(1, "cleanup bus[%08lx]\n", bus->bus_id);
> +       device_destroy(classp, bus->devnum);
>         cdev_del(&bus->cdev);
> +       kfree(bus);
>  exit:
>         IEXIT(0);
>         return;
> --
> 1.8.3.1
>
