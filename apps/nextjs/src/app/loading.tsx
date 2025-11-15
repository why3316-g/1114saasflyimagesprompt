export default function Loading() {
  return (
    <div className="flex min-h-screen flex-col items-center justify-center">
      <div className="mx-auto max-w-md text-center">
        <div className="mb-4 h-12 w-12 animate-spin rounded-full border-4 border-gray-300 border-t-blue-600 mx-auto"></div>
        <h2 className="text-xl font-semibold text-gray-900 dark:text-white">
          加载中...
        </h2>
        <p className="mt-2 text-gray-600 dark:text-gray-300">
          请稍候，正在加载页面内容
        </p>
      </div>
    </div>
  )
}