Return-Path: <eajames@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vHnCv3w8TzDqBN
 for <openbmc@lists.ozlabs.org>; Wed,  8 Feb 2017 01:44:11 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v17EhiDS060600
 for <openbmc@lists.ozlabs.org>; Tue, 7 Feb 2017 09:44:09 -0500
Received: from e33.co.us.ibm.com (e33.co.us.ibm.com [32.97.110.151])
 by mx0b-001b2d01.pphosted.com with ESMTP id 28feyn4a6v-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 07 Feb 2017 09:44:08 -0500
Received: from localhost
 by e33.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Tue, 7 Feb 2017 07:44:07 -0700
Received: from d03dlp03.boulder.ibm.com (9.17.202.179)
 by e33.co.us.ibm.com (192.168.1.133) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Tue, 7 Feb 2017 07:44:04 -0700
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by d03dlp03.boulder.ibm.com (Postfix) with ESMTP id DC56B19D8026;
 Tue,  7 Feb 2017 07:43:17 -0700 (MST)
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v17Ei48Q16777688; Tue, 7 Feb 2017 07:44:04 -0700
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F12C76E03A;
 Tue,  7 Feb 2017 07:44:03 -0700 (MST)
Received: from ltc.linux.ibm.com (unknown [9.16.170.189])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP id BA38C6E038;
 Tue,  7 Feb 2017 07:44:03 -0700 (MST)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Tue, 07 Feb 2017 08:46:17 -0600
From: eajames <eajames@linux.vnet.ibm.com>
To: Joel Stanley <joel@jms.id.au>
Cc: cbostic@linux.vnet.ibm.com, openbmc@lists.ozlabs.org, joel.stan@gmail.com
Subject: Re: [PATCH linux dev-4.7] fsi: i2c: Silence warnings
In-Reply-To: <20170205235019.12497-1-joel@jms.id.au>
References: <20170205235019.12497-1-joel@jms.id.au>
X-Sender: eajames@linux.vnet.ibm.com
User-Agent: Roundcube Webmail/1.0.1
X-TM-AS-GCONF: 00
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 17020714-0008-0000-0000-0000072665AF
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00006573; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000202; SDB=6.00818498; UDB=6.00399982; IPR=6.00595958; 
 BA=6.00005123; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00014211; XFM=3.00000011;
 UTC=2017-02-07 14:44:06
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17020714-0009-0000-0000-00003FB0707D
Message-Id: <d947b4579d9a082d708de5e5208c3a0f@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-02-07_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=2
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1612050000
 definitions=main-1702070141
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
X-List-Received-Date: Tue, 07 Feb 2017 14:44:12 -0000

Looks good to me.

Acked-by: Eddie James <eajames@us.ibm.com>

On 2017-02-05 17:50, Joel Stanley wrote:
> These were missed the first time around.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>  drivers/fsi/i2c/iic-boe.c  |  4 +++-
>  drivers/fsi/i2c/iic-mstr.c | 46 
> ++++++++--------------------------------------
>  2 files changed, 11 insertions(+), 39 deletions(-)
> 
> diff --git a/drivers/fsi/i2c/iic-boe.c b/drivers/fsi/i2c/iic-boe.c
> index 27dc8c1c048e..e7196c0115b1 100644
> --- a/drivers/fsi/i2c/iic-boe.c
> +++ b/drivers/fsi/i2c/iic-boe.c
> @@ -124,6 +124,8 @@ static iic_eng_ops_t eng_ops = {
>  int iic_boe_set_speed(iic_bus_t* bus, int i2c_hz)
>  {
>  	_clock_divider = i2c_hz;
> +
> +	return 0;
>  }
> 
>  int iic_boe_get_speed(iic_bus_t* bus)
> @@ -1220,7 +1222,7 @@ int iic_boe_rescue_timeout(iic_eng_t *eng, 
> iic_xfr_t* xfr)
> 
> 
>  	if((fifo_cnt = stat & IIC_BOE_FIFO_COUNT) > 0) {
> -		IFLDi(1, "fifo_cnt[%d]\n", fifo_cnt);
> +		IFLDi(1, "fifo_cnt[%lu]\n", fifo_cnt);
> 
>  		if(test_bit(IIC_XFR_RD, &xfr->flags))
>  		{	/* read operation */
> diff --git a/drivers/fsi/i2c/iic-mstr.c b/drivers/fsi/i2c/iic-mstr.c
> index d7f029ceea0d..0d97671eaad2 100644
> --- a/drivers/fsi/i2c/iic-mstr.c
> +++ b/drivers/fsi/i2c/iic-mstr.c
> @@ -131,27 +131,6 @@ struct file_operations iic_fops = {
>  	.mmap = iic_mmap,
>  };
> 
> -static iic_bus_t * iic_get_bus(unsigned long port, unsigned long type)
> -{
> -	iic_bus_type_t* iterator;
> -	int found = 0;
> -
> -	IENTER();
> -
> -	list_for_each_entry(iterator, &iic_bus_type_list, list)
> -	{
> -		if((iterator->type == type) && (iterator->bus->port == port))
> -		{
> -			found = 1;
> -			break;
> -		}
> -	}
> -
> -	IEXIT(0);
> -	return (found == 1)? iterator->bus: NULL;
> -}
> -
> -
>  int iic_common_open(iic_client_t ** o_client, iic_bus_t * bus, int 
> engine_num)
>  {
>  	int ret = 0;
> @@ -298,9 +277,6 @@ EXPORT_SYMBOL(iic_sideways_release);
>  int iic_release(struct inode* inode, struct file* filp)
>  {
>  	iic_client_t* client = (iic_client_t*)filp->private_data;
> -	iic_bus_t* bus = container_of(inode->i_cdev,
> -				      iic_bus_t,
> -				      cdev);
>  	IENTER();
> 
>  	IFLDs(2, "CLOSE    client[%p] bus[%08lx]\n", client, bus->bus_id);
> @@ -318,7 +294,6 @@ EXPORT_SYMBOL(iic_release);
> 
>  void iic_cleanup_xfr(iic_xfr_t* xfr, dd_ffdc_t ** o_ffdc)
>  {
> -	int i;
>  	IENTER();
> 
>  	del_timer(&xfr->delay);
> @@ -338,7 +313,6 @@ int iic_create_xfr(iic_client_t* client, struct 
> kiocb* iocb,
>  	iic_xfr_t *xfr;
>  	iic_xfr_opts_t *t_opts;
>  	iic_eng_t *eng = client->bus->eng;
> -	int i;
>  	unsigned short j = 0, count = 0, size = 0;
> 
>  	IENTER();
> @@ -393,7 +367,6 @@ int iic_create_xfr(iic_client_t* client, struct 
> kiocb* iocb,
>  	{
>  		unsigned long data_sz = xfr->size;
>  		unsigned long start;
> -		char* data = (char*)&xfr->offset_ffdc;
> 
>  		if(t_opts->wsplit)
>  		{
> @@ -1227,9 +1200,12 @@ ssize_t iic_read(struct file *filp, char __user
> *buf, size_t count,
>  	}
> 
>  	rc = iic_common_read(client, kbuf, count, offset, NULL);
> +	if (rc < 0)
> +		goto free;
> 
> -	copy_to_user(buf, kbuf, count);
> +	rc = copy_to_user(buf, kbuf, count);
> 
> +free:
>  	kfree(kbuf);
> 
>  exit:
> @@ -1339,10 +1315,13 @@ ssize_t iic_write(struct file *filp, const
> char __user *buf, size_t count,
>  		goto exit;
>  	}
> 
> -	copy_from_user(kbuf, buf, count);
> +	rc = copy_from_user(kbuf, buf, count);
> +	if (rc)
> +		goto free;
> 
>  	rc = iic_common_write(client, kbuf, count, offset, NULL);
> 
> +free:
>  	kfree(kbuf);
> 
>  exit:
> @@ -2203,7 +2182,6 @@ iic_bus_t*  iic_create_bus(struct class* classp,
> iic_eng_t* eng,
>  	IFLDi(1, "bus[%08lx] created\n", bus->bus_id);
>  	goto exit;
> 
> -exit_q_create:
>  	device_destroy(classp, bus->devnum);
>  exit_class_add:
>  	cdev_del(&bus->cdev);
> @@ -2248,14 +2226,6 @@ static void __exit iic_exit(void)
>  	IEXIT(0);
>  }
> 
> -static int iic_set_trc_sz(const char* val, struct kernel_param *kp)
> -{
> -	int rc = param_set_int(val, kp);
> -	if(rc)
> -		return rc;
> -	return 0;
> -}
> -
>  module_init(iic_init);
>  module_exit(iic_exit);
>  MODULE_AUTHOR("Eddie James <eajames@us.ibm.com>");
