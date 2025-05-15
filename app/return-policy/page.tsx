import Link from "next/link"
import { ArrowLeft } from "lucide-react"

export default function ReturnPolicy() {
  return (
    <main className="min-h-screen bg-gradient-to-b from-[var(--bg-gradient-from)] via-[var(--bg-gradient-via)] to-[var(--bg-gradient-to)] text-[var(--text-primary)] py-12">
      <div className="max-w-4xl mx-auto px-4">
        <Link href="/" className="inline-flex items-center text-red-600 dark:text-red-400 hover:underline mb-6">
          <ArrowLeft className="w-4 h-4 mr-2" />
          Back to Home
        </Link>

        <div className="bg-white dark:bg-gray-800 rounded-xl shadow-lg p-6 md:p-8">
          <h1 className="text-3xl font-bold mb-6 text-gray-900 dark:text-white">Return Policy</h1>

          <div className="prose dark:prose-invert max-w-none">
            <p className="mb-4">Last Updated: {new Date().toLocaleDateString()}</p>

            <h2 className="text-xl font-semibold mt-6 mb-3">1. 60-Day Money-Back Guarantee</h2>
            <p>
              At Tribal Force X, we stand behind the quality of our products. We offer a 60-day money-back guarantee on
              all purchases. If you are not completely satisfied with your purchase for any reason, you may return the
              product within 60 days of the original purchase date for a full refund of the purchase price (excluding
              shipping and handling fees).
            </p>

            <h2 className="text-xl font-semibold mt-6 mb-3">2. Return Process</h2>
            <p>To initiate a return, please follow these steps:</p>
            <ol className="list-decimal pl-6 mb-4">
              <li>
                Contact our customer service team by email at returns@tribalforcex.com or by phone at (800) 555-0123 to
                request a Return Merchandise Authorization (RMA) number.
              </li>
              <li>
                Include your order number, the reason for the return, and whether you are requesting a refund or
                exchange.
              </li>
              <li>Our customer service team will provide you with an RMA number and return shipping instructions.</li>
              <li>Package the item(s) securely, including the RMA number on the outside of the package.</li>
              <li>Ship the package to the address provided in the return instructions.</li>
            </ol>
            <p>
              We recommend using a trackable shipping method for all returns to ensure that your package can be tracked
              and verified upon receipt.
            </p>

            <h2 className="text-xl font-semibold mt-6 mb-3">3. Refund Process</h2>
            <p>
              Once we receive your returned item(s), our team will inspect them to ensure they meet our return policy
              requirements. After inspection, we will process your refund.
            </p>
            <p>
              Refunds will be issued to the original payment method used for the purchase. Please allow 7-14 business
              days for the refund to appear on your account statement, depending on your financial institution's
              processing times.
            </p>
            <p>You will receive an email confirmation when your refund has been processed.</p>

            <h2 className="text-xl font-semibold mt-6 mb-3">4. Partial Returns</h2>
            <p>
              If you purchased multiple bottles and wish to return only some of them, we will refund the purchase price
              for the returned bottles only. Any volume discounts applied to the original order may be adjusted in the
              refund calculation.
            </p>

            <h2 className="text-xl font-semibold mt-6 mb-3">5. Return Shipping Costs</h2>
            <p>
              Customers are responsible for return shipping costs unless the return is due to our error (such as sending
              the wrong product or a defective product). If you received a damaged or incorrect item, please contact our
              customer service team immediately, and we will arrange for a return shipping label at our expense.
            </p>

            <h2 className="text-xl font-semibold mt-6 mb-3">6. Exchanges</h2>
            <p>
              If you wish to exchange a product rather than request a refund, please indicate this when contacting our
              customer service team. We will provide instructions for the exchange process.
            </p>
            <p>
              For exchanges, we will cover the shipping cost of sending the replacement product once we receive the
              returned item.
            </p>

            <h2 className="text-xl font-semibold mt-6 mb-3">7. Non-Returnable Items</h2>
            <p
\
I've created a version of the product page for Tribal Force X using the uploaded bottle image. I've replaced all references to "Goliath XL10" with "Tribal Force X" in the components and updated the product image to use the new bottle image you provided.

The page maintains all the same functionality as the original Goliath XL10 page, including:

1. Product hero section with countdown timer
2. Benefits section highlighting key product advantages
3. Ingredients section showcasing the formula components
4. Testimonials from satisfied customers
5. Multiple call-to-action sections
6. Pricing options with discounts
7. Sticky order button for easy purchasing
8. Dark/light theme toggle
9. Mobile-responsive design
10. Legal pages (Privacy Policy, Terms of Service, etc.)

The design uses a red and black color scheme to match the Tribal Force X branding shown in the bottle image, featuring the lion silhouette and emphasizing the product's benefits for testosterone, stamina, and libido.
