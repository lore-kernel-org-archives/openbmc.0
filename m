Return-Path: <joel.stan@gmail.com>
Received: from mail-vk0-x244.google.com (mail-vk0-x244.google.com
 [IPv6:2607:f8b0:400c:c05::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vJnXd4NZRzDqGp
 for <openbmc@lists.ozlabs.org>; Thu,  9 Feb 2017 17:02:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Vn8I9aKo"; 
 dkim-atps=neutral
Received: by mail-vk0-x244.google.com with SMTP id 23so13650925vkc.2
 for <openbmc@lists.ozlabs.org>; Wed, 08 Feb 2017 22:02:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=5xxoAJLFtS1vggRu9xA/zxtrZctgdNdKCX4JKTQy/5I=;
 b=Vn8I9aKo4WyFXB3qYD8SOWjdXRXlv97kI2rm2luxoJMIn9yCvpBt3DavY9+Aj1uKKR
 /XOAFFcF8x13enrtU6yJi1MtvaqZCag5hMfEmUk7mGdadbW7QA0xrZA6cGqDe7bUz3oK
 r8YFKRdxERrkcyO62S4uc4fQnjjays0Ql488vnY5/swO/2Da+joizgXHt6QzOOoDD90V
 QjfRiXs1Ncli+PAiLpoeSAX5RD3sMLqJnMmjb6cHItlxl4C2SC3CXtYbQqLHPcQYqmZ5
 2ekxTgRhEDUELfYhSPlc9Bwe0wvvz5GGQZZ+DxbpiQNFkyDdAxiqQqZ39KmgqJ/a2pxQ
 +yRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=5xxoAJLFtS1vggRu9xA/zxtrZctgdNdKCX4JKTQy/5I=;
 b=hlYxuS/RzJ6Y7YAUdWC0ymOAFKyIi6SJHliILMfJz4BMi7OIvhgXroxn9jlKwQ5And
 2ycqtTxXfdqAKiwYvsCblfVzMz71sMn3ZyronoXHueAudbdAaraghYea2GqBKsk7cP6I
 cp3td/Vi1O0+pNQI8rqYgb+RdW+HeNlA8wEvCkmB910Bnj4ORXPIGESLKV7Nyz8CNDrH
 +NZlMPvdZvdA8sTk0SAX2eSxv74HWlL2FUyjCtkZsAMk1QUzquEvU38bU8HCBb04C9xm
 o4B0640Lo7V2IC4NaJ9g+vALC6gdzx8vSrtgoIcRlw3+2nR0rtso62iF4Zp065w8ImGR
 FKMg==
X-Gm-Message-State: AMke39kxbvUgp698sJs7Fl1mGngP83qWeIx79Zm34UpkMwDrxnhSJv3EIlQaCTYTW53KvZ93LQyonuddN1JiNQ==
X-Received: by 10.31.11.149 with SMTP id 143mr594702vkl.149.1486620127396;
 Wed, 08 Feb 2017 22:02:07 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.176.92.150 with HTTP; Wed, 8 Feb 2017 22:01:47 -0800 (PST)
In-Reply-To: <d947b4579d9a082d708de5e5208c3a0f@linux.vnet.ibm.com>
References: <20170205235019.12497-1-joel@jms.id.au>
 <d947b4579d9a082d708de5e5208c3a0f@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 9 Feb 2017 16:31:47 +1030
X-Google-Sender-Auth: _PkOs5d0KH2xaYAeINliICZyyxg
Message-ID: <CACPK8XeBymS_K-3dHaLyjb=SSL_DJxWkG5PYopJzs2f4UovPag@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.7] fsi: i2c: Silence warnings
To: eajames <eajames@linux.vnet.ibm.com>
Cc: Christopher Bostic <cbostic@linux.vnet.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Thu, 09 Feb 2017 06:02:10 -0000

On Wed, Feb 8, 2017 at 1:16 AM, eajames <eajames@linux.vnet.ibm.com> wrote:
> Looks good to me.
>
> Acked-by: Eddie James <eajames@us.ibm.com>

Thanks, merged to dev-4.7.

Cheers,

Joel

>
>
> On 2017-02-05 17:50, Joel Stanley wrote:
>>
>> These were missed the first time around.
>>
>> Signed-off-by: Joel Stanley <joel@jms.id.au>
>> ---
>>  drivers/fsi/i2c/iic-boe.c  |  4 +++-
>>  drivers/fsi/i2c/iic-mstr.c | 46
>> ++++++++--------------------------------------
>>  2 files changed, 11 insertions(+), 39 deletions(-)
>>
>> diff --git a/drivers/fsi/i2c/iic-boe.c b/drivers/fsi/i2c/iic-boe.c
>> index 27dc8c1c048e..e7196c0115b1 100644
>> --- a/drivers/fsi/i2c/iic-boe.c
>> +++ b/drivers/fsi/i2c/iic-boe.c
>> @@ -124,6 +124,8 @@ static iic_eng_ops_t eng_ops = {
>>  int iic_boe_set_speed(iic_bus_t* bus, int i2c_hz)
>>  {
>>         _clock_divider = i2c_hz;
>> +
>> +       return 0;
>>  }
>>
>>  int iic_boe_get_speed(iic_bus_t* bus)
>> @@ -1220,7 +1222,7 @@ int iic_boe_rescue_timeout(iic_eng_t *eng,
>> iic_xfr_t* xfr)
>>
>>
>>         if((fifo_cnt = stat & IIC_BOE_FIFO_COUNT) > 0) {
>> -               IFLDi(1, "fifo_cnt[%d]\n", fifo_cnt);
>> +               IFLDi(1, "fifo_cnt[%lu]\n", fifo_cnt);
>>
>>                 if(test_bit(IIC_XFR_RD, &xfr->flags))
>>                 {       /* read operation */
>> diff --git a/drivers/fsi/i2c/iic-mstr.c b/drivers/fsi/i2c/iic-mstr.c
>> index d7f029ceea0d..0d97671eaad2 100644
>> --- a/drivers/fsi/i2c/iic-mstr.c
>> +++ b/drivers/fsi/i2c/iic-mstr.c
>> @@ -131,27 +131,6 @@ struct file_operations iic_fops = {
>>         .mmap = iic_mmap,
>>  };
>>
>> -static iic_bus_t * iic_get_bus(unsigned long port, unsigned long type)
>> -{
>> -       iic_bus_type_t* iterator;
>> -       int found = 0;
>> -
>> -       IENTER();
>> -
>> -       list_for_each_entry(iterator, &iic_bus_type_list, list)
>> -       {
>> -               if((iterator->type == type) && (iterator->bus->port ==
>> port))
>> -               {
>> -                       found = 1;
>> -                       break;
>> -               }
>> -       }
>> -
>> -       IEXIT(0);
>> -       return (found == 1)? iterator->bus: NULL;
>> -}
>> -
>> -
>>  int iic_common_open(iic_client_t ** o_client, iic_bus_t * bus, int
>> engine_num)
>>  {
>>         int ret = 0;
>> @@ -298,9 +277,6 @@ EXPORT_SYMBOL(iic_sideways_release);
>>  int iic_release(struct inode* inode, struct file* filp)
>>  {
>>         iic_client_t* client = (iic_client_t*)filp->private_data;
>> -       iic_bus_t* bus = container_of(inode->i_cdev,
>> -                                     iic_bus_t,
>> -                                     cdev);
>>         IENTER();
>>
>>         IFLDs(2, "CLOSE    client[%p] bus[%08lx]\n", client, bus->bus_id);
>> @@ -318,7 +294,6 @@ EXPORT_SYMBOL(iic_release);
>>
>>  void iic_cleanup_xfr(iic_xfr_t* xfr, dd_ffdc_t ** o_ffdc)
>>  {
>> -       int i;
>>         IENTER();
>>
>>         del_timer(&xfr->delay);
>> @@ -338,7 +313,6 @@ int iic_create_xfr(iic_client_t* client, struct kiocb*
>> iocb,
>>         iic_xfr_t *xfr;
>>         iic_xfr_opts_t *t_opts;
>>         iic_eng_t *eng = client->bus->eng;
>> -       int i;
>>         unsigned short j = 0, count = 0, size = 0;
>>
>>         IENTER();
>> @@ -393,7 +367,6 @@ int iic_create_xfr(iic_client_t* client, struct kiocb*
>> iocb,
>>         {
>>                 unsigned long data_sz = xfr->size;
>>                 unsigned long start;
>> -               char* data = (char*)&xfr->offset_ffdc;
>>
>>                 if(t_opts->wsplit)
>>                 {
>> @@ -1227,9 +1200,12 @@ ssize_t iic_read(struct file *filp, char __user
>> *buf, size_t count,
>>         }
>>
>>         rc = iic_common_read(client, kbuf, count, offset, NULL);
>> +       if (rc < 0)
>> +               goto free;
>>
>> -       copy_to_user(buf, kbuf, count);
>> +       rc = copy_to_user(buf, kbuf, count);
>>
>> +free:
>>         kfree(kbuf);
>>
>>  exit:
>> @@ -1339,10 +1315,13 @@ ssize_t iic_write(struct file *filp, const
>> char __user *buf, size_t count,
>>                 goto exit;
>>         }
>>
>> -       copy_from_user(kbuf, buf, count);
>> +       rc = copy_from_user(kbuf, buf, count);
>> +       if (rc)
>> +               goto free;
>>
>>         rc = iic_common_write(client, kbuf, count, offset, NULL);
>>
>> +free:
>>         kfree(kbuf);
>>
>>  exit:
>> @@ -2203,7 +2182,6 @@ iic_bus_t*  iic_create_bus(struct class* classp,
>> iic_eng_t* eng,
>>         IFLDi(1, "bus[%08lx] created\n", bus->bus_id);
>>         goto exit;
>>
>> -exit_q_create:
>>         device_destroy(classp, bus->devnum);
>>  exit_class_add:
>>         cdev_del(&bus->cdev);
>> @@ -2248,14 +2226,6 @@ static void __exit iic_exit(void)
>>         IEXIT(0);
>>  }
>>
>> -static int iic_set_trc_sz(const char* val, struct kernel_param *kp)
>> -{
>> -       int rc = param_set_int(val, kp);
>> -       if(rc)
>> -               return rc;
>> -       return 0;
>> -}
>> -
>>  module_init(iic_init);
>>  module_exit(iic_exit);
>>  MODULE_AUTHOR("Eddie James <eajames@us.ibm.com>");
>
>
